{% wire id="med-form" type="submit" postback={newmessage id=id} delegate="mod_med" %}

<form class="form-horizontal" id="med-form" action="postback">

<div class="span12">
    <div class="container-fluid" >
   <div class="row-fluid">

    <div class="span4 well-table" style="background:#3CBFCB;height:350px;width:287px;">
<div class="container" style="width:287px">

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
            <label class="control-label" for="weight" style="color:white;">Weight</label>
            <div class="controls">
              <input id="weight" name="weight" type="text" placeholder="" class="input-mini">
              {% validate id="weight" type={numericality minimum=0 maximum=500} %}
              <select style="width:70px">
                <option>kg</option>
                <option>lb</option>
              </select>
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
	


</div>
</div>
   <div class="span4">
      <div class="well-table" style="background: #FD7749;height:328px;">
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
    <div class="well-table" style="background:#a344d3;height:328px;">
      <table class="table" style="background:#a344d3;color:whitesmoke;">
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
<div class="container-fluid">
<div class="row-fluid">
<div class="span4">
    <div class="well-table" style="background:#2a81a7;">
    <label style="color: WhiteSmoke;">Respiratory mechanics: Otis equation</label>    <!--color: #4A4A4A-->

  
	<div class="control-group" >
            <label class="control-label" for="minvol" style="color:white">% MinVol</label>
            <div class="controls">
              <input id="minvol" name="minvol" type="text" class="input-small" value="100">
            </div>
          </div> 
	<div class="control-group" >
            <label class="control-label" for="raw" style="color:white">Raw</label>
            <div class="controls">
              <input id="raw" name="raw" type="text" class="input-small" value="20">
 
            </div>
          </div>
 	<div class="control-group" >
            <label class="control-label" for="crs" style="color:white">Crs</label>
            <div class="controls">
              <input id="crs" name="crs" type="text" class="input-small" value="50">
              {% validate id="crs" type={numericality} %} 
            </div>
          </div>
 	<div class="control-group" >
            <label class="control-label" for="rext" style="color:white">Rext</label>
            <div class="controls">
              <input id="rext" name="rext" type="text" class="input-small" value="0">
              {% validate id="rext" type={numericality} %} 
            </div>
	</div>  
 	        


    </div>
    </div>

 <div class="span4">
    <div class="well-table" style="background:#2a81a7;">
    <label style="color: WhiteSmoke;">Respiratory mechanics: Otis equation</label>    <!--color: #4A4A4A-->
      <table class="table" style="background:#2a81a7;Color:WhiteSmoke">
        <thead>
          <tr>
            <th>Parameter</th>
            <th>Value</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>V'e</td>
            <td id="v_e" name="ve"></td>
          </tr>
          <tr>
            <td>Vd</td>
            <td id="vd" name="vd"></td>
          </tr>
          <tr>
            <td>V'd</td>
            <td id="v_d" name="v_d"></td>
          </tr>
          <tr>
            <td>V'A</td>
            <td id="v_a" name="v_a"></td>
          </tr>
          <tr>
            <td>Rtot</td>
            <td id="rtot" name="rtot"></td>
          </tr>
	  <tr>
            <td>RC</td>
            <td id="rc" name="rc"></td>
          </tr>
        </tbody>
      </table>
    </div>
    </div>
     
    <div class="span4">
    <div class="well-table" style="background:#0a67a3;">
    <label style="color: whitesmoke">Respiratory mechanics</label>
      <table class="table" style="background:#0a67a3;color:whitesmoke;">
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
        </tbody>
      </table>
    </div>
</div>
 
</div>
</div>
</div>
</form>

