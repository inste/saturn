{% wire id="med-form" type="submit" postback={newmessage id=id} delegate="mod_med" %}

<div class="span12">
    <div class="container-fluid" >
   <div class="row-fluid">

    <div class="span4 well-table" style="background:#3CBFCB;height:420px;width:287px">
<div class="container" style="width:287px">
<form class=" form-horizontal" id="med-form" action="postback" style="width:287px">
          <div class="control-group" >
            <label class="control-label" for="patient_id" style="color:white">Patient ID</label>
            <div class="controls">
              <input id="patient_id" name="patient_id" type="text" class="input-small">
             <!-- {% validate id="patient_id" type={numericality} %} -->
            </div>
          </div>
          <div class="control-group ">
            <label class="control-label" for="age" style="color:white">Age</label>
            <div class="controls">
              <input id="age" name="age" type="text" class="input-small"> 
              {% validate id="age" type={numericality minimum=0 maximum=150} %}
            </div>
          </div>
          <!-- Multiple Radios -->
          <div class="control-group">
            <label class="control-label" for="sex" style="color:white">Sex</label> 
            <div class="controls">
              <label class="radio" for="sex-0" >
                <input type="radio" name="sex" id="sex-0" value="Male" checked="checked">Male</label>
		<label class="control-label" for="sex" style="color:#3CBFCB">Sex</label> <!--bug-->
              <label class="radio" for="sex-1" >
                <input type="radio" name="sex" id="sex-1" value="Female"> Female</label>
            </div>
          </div>
          <!-- Text input-->
          <div class="control-group">
            <label class="control-label" for="height" style="color:white">Height</label>
            <div class="controls">
              <input id="height" name="height" type="text" placeholder="" class="input-mini">
              {% validate id="height" type={numericality minimum=0 maximum=270} %}
              <select style="width:70px">
                <option>cm</option>
                <option>in</option>
              </select>
            </div>
          </div>
          <!-- Text input-->
          <div class="control-group">
            <label class="control-label" for="weight" style="color:white">Weight</label>
            <div class="controls">
              <input id="weight" name="weight" type="text" placeholder="" class="input-mini">
              {% validate id="weight" type={numericality minimum=0 maximum=500} %}
              <select style="width:70px">
                <option>kg</option>
                <option>lb</option>
              </select>
            </div>
          </div>
	  <div class="control-group ">
            <label class="control-label" for="minvol" style="color:white">MinVol</label>
            <div class="controls">
              <input id="minvol" name="minvol" type="text" class="input-small"> 
              {% validate id="minvol" type={numericality minimum=0 maximum=500} %}
            </div>
          </div>
          <!-- Button (Double) -->
          <div class="control-group">
            <label class="control-label" for=""></label>
            <div class="controls">
              <button type="submit" class="btn btn-golf">Solve</button>
              <button type="reset" class="btn btn-default" onclick="location.reload();">Reset</button>
            </div>
          </div>

</form>
</div>
</div>
   <!-- <div class="span4"> <div class="well-table" style="background:Cornsilk"></div></div> -->
    <div class="span8">
    <div class="well-table" style="background:#2a81a7">
    <label style="color: WhiteSmoke;">Medications</label>    <!--color: #4A4A4A-->
      <table class="table" style="background:#2a81a7;Color:WhiteSmoke">
        <thead>
          <tr>
            <th>Drug</th>
            <th>Rule</th>
            <th>Dose</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>Vecuronium</td>
            <td>1 ED95 (0.05 mg/kg)</td>
            <td id="vecuronium" name="vecuronium"></td>
          </tr>
          <tr>
            <td>Neostigmine</td>
            <td>(0.04 - 0.07 mg/kg)</td>
            <td id="neostigmine" name="neostigmine"></td>
          </tr>
          <tr>
            <td>Atropine</td>
            <td>(0.02 mg/kg)</td>
            <td id="atropine" name="atropine"></td>
          </tr>
          <tr>
            <td>Lidocaine</td>
            <td>(1.5 - 5 mg/kg)</td>
            <td id="lidocaine" name="lidocaine"></td>
          </tr>
          <tr>
            <td>Bupivacaine</td>
            <td>(1.5 - 3 mg/kg)</td>
            <td id="bupivacaine" name="bupivacaine"></td>
          </tr>
          <tr>
            <td>Intralipid</td>
            <td>(1.5 ml/kg)</td>
            <td id="intralipid_1" name="intralipid_1"></td>
          </tr>
          <tr>
            <td>Intralipid</td>
            <td>(0.25 - 0.5 ml/kg/m)</td>
            <td id="intralipid_2" name="intralipid_2"></td>
          </tr>
          <tr>
            <td>Naloxone</td>
            <td>titrate 0.1 - 2 mg<br>max 10 mg</td>
            <td id="naloxone" name="naloxone"></td>
          </tr>
        </tbody>
      </table>
    </div>
    </div>
</div>
</div>
<div class="container-fluid">
<div class="row-fluid"><div class="span4">
      <div class="well-table" style="background: #FD7749">
     <label style="color: WhiteSmoke;">Anthropometric</label>
      <table class="table" style="background: #FD7749;color: WhiteSmoke;">
        <thead>
          <tr>
            <th>Parameter</th>
            <th>Value</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>IBW</td>
            <td id="ibw" name="ibw">&nbsp;</td>
          </tr>
          <tr>
            <td>IBW+30</td>
            <td id="ibw130" name="ibw130">&nbsp</td>
          </tr>
          <tr>
            <td>ABW</td>
            <td id="abw" name="abw">&nbsp;</td>
          </tr>
          <tr>
            <td>BSA</td>
            <td id="bsa" name="bsa">&nbsp;</td>
          </tr>
          <tr>
            <td>BMI</td>
            <td id="bmi" name="bmi">&nbsp;</td>
          </tr>
	  <tr>
	    <td>BMI</td>
            <td id="bmi_class" name="bmi_class">&nbsp;</td>  
          </tr>
        </tbody>
      </table>
    </div>
</div>
    <div class="span4">
    <div class="well-table" style="background:#0a67a3">
    <label style="color: whitesmoke">Respiratory mechanics</label>
      <table class="table" style="background:#0a67a3;color:whitesmoke">
        <thead>
          <tr>
            <th>Parameter</th>
            <th>Value</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>MV</td>
            <td id="mv" name="mv"></td>
          </tr>
          <tr>
            <td>VT</td>
            <td id="vt" name="vt"></td>
          </tr>
          <tr>
            <td>f</td>
            <td id="f" name="f"></td>
          </tr>
          <tr>
            <td>PEEP</td>
            <td id="peep" name="peep"></td>
          </tr>
          <tr>
            <td>I:E</td>
            <td id="ie" name="ie"></td>
          </tr>
	  <tr>
            <td>Tests</td>
            <td id="tests" name="tests"></td>
          </tr>
        </tbody>
      </table>
    </div>
</div>
 <div class="span4">
    <div class="well-table" style="background:#a344d3">
      <table class="table" style="background:#a344d3;color:whitesmoke">
        <thead>
          <tr>
            <th>BMI value</th>
            <th>Class</th>
          </tr>
        </thead>
        <tbody>
           <tr>
            <td>BMI&lt;18.5</td>
            <td>Below normal</td>
          </tr>
          <tr>
            <td>18.5=&lt;BMI&lt;25</td>
            <td>Normal</td>
          </tr>
          <tr>
            <td>25=&lt;BMI&lt;30</td>
            <td>Overweight</td>
          </tr>
          <tr>
            <td>30=&lt;BMI&lt;35</td>
            <td>Class I Obesity</td>
          </tr>
          <tr>
            <td>35=&lt;BMI&lt;40</td>
            <td>Class II Obesity</td>
          </tr>
	   <tr>
            <td>40=&lt;BMI</td>
            <td>Class III Obesity</td>
          </tr>
        </tbody>
      </table>
    </div>
</div>
   </div>
 </div>
  
