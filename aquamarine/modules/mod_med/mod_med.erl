  -module(mod_med).
  -author("Bubnov Artem").
  -mod_title("Medicine_mod").
  -mod_description("Medicine module").
 
  %% interface functions
  -export([event/2]).
  -include_lib("zotonic.hrl").
  %% @doc Handle the submit event of hello
  event({submit, {newmessage, _}, _TriggerId, _TargetId}, Context) -> 
     %% PatId = list_to_integer(z_context:get_q("patient_id", Context)), 
     %% Age = list_to_integer(z_context:get_q_validated("age", Context)),   
      Weight = list_to_integer(z_context:get_q_validated("weight", Context)),
      Height = list_to_integer(z_context:get_q_validated("height", Context)),
      %% Otis
      MinVol_inserted = list_to_integer(z_context:get_q("minvol", Context)), %%validated
      Raw = list_to_integer(z_context:get_q("raw", Context)), %%validated
      Crs= list_to_integer(z_context:get_q("crs", Context)), %%validated
      Rext= list_to_integer(z_context:get_q("rext", Context)), %%validated
      %% IBW
      Sex = z_context:get_q("sex", Context),
      case Sex of
      "Male" ->IBW=male(Height);
      "Female" ->IBW=female(Height)
      end,
      %%Otis calculations
      
	%%antropo
      IBW130=IBW*1.3,
      ABW=IBW+0.4*(Weight-IBW),
      BSA=0.0235*math:exp(0.42246*math:log(Height))*math:exp(0.51456*math:log(Weight)),  %%x^y = exp(y*ln(x))
      BMI=Weight/(Height*Height/10000),
      BMI_class=bmi_class(BMI),
	%%Otis
      F=best_rate(IBW,MinVol_inserted,Rext,Raw,Crs),
      V_e=ve(IBW,MinVol_inserted)/1000, %%MV=V_e
      VT=round(V_e*1000/F),
      Vd=vd(IBW),
      V_d=F*Vd/1000, 
      V_A=F*(V_e*1000/F-Vd)/1000,
      Rtot=rtot(Rext,Raw),
      RC=rc(Crs,Rtot),
      PEEP=5,
      E=e(F),
      IE=['1']++[' : ']++io_lib:format("~.2f",[E]),
	%% medications
      Vecuronium=0.05*IBW,
      Neostigmine=dose(0.04,0.07,IBW,'mg'),
      Atropine=0.02*ABW,
      Lidocaine=dose(1.5,5,ABW,'mg'),
      Bupivacaine=dose(1.5,3,ABW,'mg'),
      Intralipid_1=1.5*ABW,
      Intralipid_2=dose(0.25,0.5,ABW,'ml'),  %%kg/m ???
      Naloxone=dose(0.1,2.0,1.0,'mg'),
 	
      z_render:update("abw", io_lib:format("~.2f",[ABW])++[' kg'], 
            z_render:update("peep", integer_to_list(PEEP)++[' cm H2O'], 
            z_render:update("f", integer_to_list(F)++[' bpm'], 
            z_render:update("vt", integer_to_list(VT)++[' ml'], 
            z_render:update("mv", io_lib:format("~.2f",[V_e])++[' L/min'],%%MV=V_e
            z_render:update("bmi", io_lib:format("~.2f",[BMI])++[' kg/m&sup2'], 
            z_render:update("bmi_class", BMI_class,  
	    z_render:update("bsa", io_lib:format("~.2f",[BSA])++[' m&sup2'],  
            z_render:update("ibw130", io_lib:format("~.2f",[IBW130])++[' kg'],   
	    z_render:update("ibw", io_lib:format("~.2f",[IBW])++[' kg'],
	    z_render:update("ie", IE, 
   	    %% Otis 
	    z_render:update("vd", io_lib:format("~.1f",[Vd])++[' ml'], 
	    z_render:update("v_d", io_lib:format("~.1f",[V_d])++[' l/min'], 
	    z_render:update("v_a", io_lib:format("~.1f",[V_A])++[' l/min'], 
	    z_render:update("rtot", integer_to_list(Rtot)++[' cmH2O/l/s'], 
	    z_render:update("rc", io_lib:format("~.3f",[RC])++[' s'],
	    z_render:update("naloxone",Naloxone,
	    z_render:update("intralipid_2",Intralipid_2,
	    z_render:update("intralipid_1",io_lib:format("~.2f",[Intralipid_1])++[' ml'],
	    z_render:update("bupivacaine",Bupivacaine,
	    z_render:update("lidocaine",Lidocaine,
	    z_render:update("atropine",io_lib:format("~.2f",[Atropine])++[' mg'],
	    z_render:update("vecuronium", io_lib:format("~.2f",[Vecuronium])++[' mg'], 
	    z_render:update("neostigmine", Neostigmine,Context)))))))))))))))))))))))).
      
        dose(Mn,Mx,BW,End) ->
		Min=Mn*BW,
		Max=Mx*BW,
                f_dash_f(Min,Max)++[' ',End].


	f_dash_f(Min,Max) ->
		io_lib:format("~.2f",[Min])++[' - ']++io_lib:format("~.2f",[Max]).   



	male(Height) ->
		50+2.5*(Height-152.4)/2.54.

	female(Height) ->
		45.5+2.5*(Height-152.4)/2.54.

	e(F) ->
		case F of
		N when N >= 15 -> 1.0;
		N when N < 15 ->
			(60/F-2)/2
		end.

	bmi_class(BMI)->
		case BMI of
		N when N<18.5 ->'Below normal';
		N when N <25 ->'Normal';
		N when N <30 ->'Overweight';
		N when N <35 ->'Class I Obesity';
		N when N <40 ->'Class II Obesity';
		N when N >=40 ->'Class III Obesity'
		end.


	%% Otis
	best_rate(IBW,MinVol_inserted,Rext,Raw,Crs) ->
                A=a(),
		Rtot=rtot(Rext,Raw),
		RC=rc(Crs,Rtot),
		Ve=ve(IBW,MinVol_inserted),
		Vd=vd(IBW),
		round(otis_f(A,RC,Ve,Vd,0)).

        otis_f(A,RC,Ve,Vd,Tail) ->
		Result=(math:sqrt(1+2*A*RC*(Ve-Tail*Vd)/Vd)-1)/(A*RC),
		T=round(Tail*1000),
		case round(Result*1000) of
		T -> Result;
		_ -> otis_f(A,RC,Ve,Vd,Result)
                end. 

	a() ->
		(2*math:pi()*math:pi())/60.

	rc(Crs,Rtot) ->
		%Rtot=rtot(Rext,Raw),
		%%Crs=50,%%ml/mbar
		Rtot*Crs/1000.

	rtot(Rext,Raw) -> 
		Rext+Raw.

	ve(IBW,MinVol_inserted) -> 
		MinVol=minvol(IBW,MinVol_inserted),
		1000*MinVol.

	vd(IBW) -> 
		(IBW*2.2).

	minvol(IBW,MinVol_inserted) ->
		VentReq=100, %%ml/min/kg
		MinVol_inserted*IBW*VentReq/100/1000.

	
