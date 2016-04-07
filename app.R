library(shiny)
ui<-fluidPage(
  #useShinyjs(),
  tags$head(
    tags$style(
      HTML("     
    .selectButton {
        font-size: 12px;
    }

    .btn1 {
      border-style: 1px solid;
      position: absolute;
      left: 50%;
    }

    div.shiny-options-group {
      position: relative;
      left: 15%;
    -webkit-column-width: 500px; /* Chrome, Safari, Opera */
    -moz-column-width: 100px; /* Firefox */
    column-width: 500px;
    }

    h4.title_pos2 {
      position: relative;
      left: 2%;

    }

    "))
  ),
  column(10,offset=1,
    HTML('<h1>Identify tissue/sample-specific regions with specific epigenetic features</h1>'),
    HTML('<p>This tool allow users to identify regions with specific epigenetic features in some tissues/samples but not 
    other tissues/samples, like tissue-specific enhancers or H3K27ac peaks present in brain tissue but not other tissues.
    Users need to define foreground samples and background samples. Three methods are provided for identify these regions. </p>'),
    tags$hr()
  ),
  column(10,offset=1,
  HTML(' <br> <label>select features:</label>'),
  tabsetPanel(
    tabPanel(
      "ChromHMM",
  selectInput("selectHMM", "select ChromHMM model:",
            c("18 model" ,
              "15 model" )
            ),
  fluidRow(column(8,
  conditionalPanel(condition = "input.selectHMM == '15 model'",
    HTML('
  <br>
  <label>select samples:</label>
  <span class="tab"></span> <button id="selectAll" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
  <br>
  '),
HTML('

  <br>
  <div class="panel-group">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title title_pos1">          
          <a data-toggle="collapse" href="#collapse_Adult_Tissue"> Adult Cells/Tissues <span class="caret"></span></a>
        </h4>
      </div>   
    <div id="collapse_Adult_Tissue" class="panel-collapse collapse">


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Blood_Adult" >Blood <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Blood_Adult" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>        
            <div id="collapse_Blood_Adult" class="panel-collapse collapse"> 
              <div id="Blood_Adult" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult" value="E062"/>
                      <span class="checkContent" id="myt1">E062 Primary mononuclear cells from peripheral blood</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult" value="E034"/>
                      <span class="checkContent">E034 Primary T cells from peripheral blood</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult" value="E045"/>
                      <span class="checkContent">E045 Primary T cells effector/memory enriched from peripheral blood</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult" value="E044"/>
                      <span class="checkContent">E044 Primary T regulatory cells from peripheral blood</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult" value="E043"/>
                      <span class="checkContent">E043 Primary T helper cells from peripheral blood</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult" value="E039"/>
                      <span class="checkContent">E039 Primary T helper naive cells from peripheral blood</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult" value="E041"/>
                      <span class="checkContent">E041 Primary T helper cells PMA-I stimulated</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult" value="E042"/>
                      <span class="checkContent">E042 Primary T helper 17 cells PMA-I stimulated</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult" value="E040"/>
                      <span class="checkContent">E040 Primary T helper memory cells from peripheral blood 1</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult" value="E037"/>
                      <span class="checkContent">E037 Primary T helper memory cells from peripheral blood 2</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult" value="E048"/>
                      <span class="checkContent">E048 Primary T CD8+ memory cells from peripheral blood</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult" value="E038"/>
                      <span class="checkContent">E038 Primary T helper naive cells from peripheral blood</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult" value="E047"/>
                      <span class="checkContent">E047 Primary T CD8+ naive cells from peripheral blood</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult" value="E029"/>
                      <span class="checkContent">E029 Primary monocytes from peripheral blood</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult" value="E035"/>
                      <span class="checkContent">E035 Primary hematopoietic stem cells</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult" value="E051"/>
                      <span class="checkContent">E051 Primary hematopoietic stem cells G-CSF-mobilized Male</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult" value="E050"/>
                      <span class="checkContent">E050 Primary hematopoietic stem cells G-CSF-mobilized Female</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult" value="E036"/>
                      <span class="checkContent">E036 Primary hematopoietic stem cells short term culture</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult" value="E032"/>
                      <span class="checkContent">E032 Primary B cells from peripheral blood</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult" value="E046"/>
                      <span class="checkContent">E046 Primary Natural Killer cells from peripheral blood</span>
                    </label>
                  </div> 
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult" value="E030"/>
                      <span class="checkContent">E030 Primary neutrophils from peripheral blood</span>
                    </label>
                  </div> 
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult" value="E124"/>
                      <span class="checkContent">E124 Monocytes-CD14+ RO01746 Primary Cells</span>
                    </label>
                  </div>                                                                                                                                                                                                                                                                                                 
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Brain_Adult" >Brain <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Brain_Adult" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>        
            <div id="collapse_Brain_Adult" class="panel-collapse collapse"> 
              <div id="Brain_Adult" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Brain_Adult" value="E071"/>
                      <span class="checkContent">E071 Brain Hippocampus Middle</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Brain_Adult" value="E074"/>
                      <span class="checkContent">E074 Brain Substantia Nigra</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Brain_Adult" value="E068"/>
                      <span class="checkContent">E068 Brain Anterior Caudate</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Brain_Adult" value="E069"/>
                      <span class="checkContent">E069 Brain Cingulate Gyrus</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Brain_Adult" value="E072"/>
                      <span class="checkContent">E072 Brain Inferior Temporal Lobe</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Brain_Adult" value="E067"/>
                      <span class="checkContent">E067 Brain Angular Gyrus</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Brain_Adult" value="E073"/>
                      <span class="checkContent">E073 Brain_Dorsolateral_Prefrontal_Cortex</span>
                    </label>
                  </div>                 
                </div>
              </div> 
            </div>
        </div>
 

        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Breast_Adult" >Breast <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Breast_Adult" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Breast_Adult" class="panel-collapse collapse"> 
              <div id="Breast_Adult" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Breast_Adult" value="E027"/>
                      <span class="checkContent">E027 Breast Myoepithelial Primary Cells</span>
                    </label>
                  </div>
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Fat_Adult" >Fat <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Fat_Adult" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Fat_Adult" class="panel-collapse collapse"> 
              <div id="Fat_Adult" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Fat_Adult" value="E063"/>
                      <span class="checkContent">E063 Adipose Nuclei</span>
                    </label>
                  </div>
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_GI_Colon_Adult" >GI_Colon <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_GI_Colon_Adult" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_GI_Colon_Adult" class="panel-collapse collapse"> 
              <div id="GI_Colon_Adult" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="GI_Colon_Adult" value="E076"/>
                      <span class="checkContent">E076 Colon Smooth Muscle</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="GI_Colon_Adult" value="E106"/>
                      <span class="checkContent">E106 Sigmoid Colon</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="GI_Colon_Adult" value="E075"/>
                      <span class="checkContent">E075 Colonic Mucosa</span>
                    </label>
                  </div>                                    
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_GI_Duodenum_Adult" >GI_Duodenum <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_GI_Duodenum_Adult" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_GI_Duodenum_Adult" class="panel-collapse collapse"> 
              <div id="GI_Duodenum_Adult" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="GI_Duodenum_Adult" value="E078"/>
                      <span class="checkContent">E078 Duodenu</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="GI_Duodenum_Adult" value="E077"/>
                      <span class="checkContent">E077 Duodenum Mucosa</span>
                    </label>
                  </div>                                   
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_GI_Esophagus_Adult" >GI_Esophagus <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_GI_Esophagus_Adult" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_GI_Esophagus_Adult" class="panel-collapse collapse"> 
              <div id="GI_Esophagus_Adult" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="GI_Esophagus_Adult" value="E079"/>
                      <span class="checkContent">E079 Esophagus</span>
                    </label>
                  </div>                                   
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_GI_Intestine_Adult" >GI_Intestine <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_GI_Intestine_Adult" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_GI_Intestine_Adult" class="panel-collapse collapse"> 
              <div id="GI_Intestine_Adult" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="GI_Intestine_Adult" value="E109"/>
                      <span class="checkContent">E109 Small Intestin</span>
                    </label>
                  </div>                                   
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_GI_Rectum_Adult" >GI_Rectum <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_GI_Rectum_Adult" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_GI_Rectum_Adult" class="panel-collapse collapse"> 
              <div id="GI_Rectum_Adult" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="GI_Rectum_Adult" value="E103"/>
                      <span class="checkContent">E103 Rectal Smooth Muscle</span>
                    </label>
                  </div>   
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="GI_Rectum_Adult" value="E101"/>
                      <span class="checkContent">E101 Rectal Mucosa Donor 29</span>
                    </label>
                  </div> 
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="GI_Rectum_Adult" value="E102"/>
                      <span class="checkContent">E102 Rectal Mucosa Donor 31</span>
                    </label>
                  </div>                                                                     
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_GI_Stomach_Adult" >GI_Stomach <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_GI_Stomach_Adult" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_GI_Stomach_Adult" class="panel-collapse collapse"> 
              <div id="GI_Stomach_Adult" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="GI_Stomach_Adult" value="E111"/>
                      <span class="checkContent">E111 Stomach Smooth Muscle</span>
                    </label>
                  </div>   
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="GI_Stomach_Adult" value="E110"/>
                      <span class="checkContent">E110 Stomach Mucosa</span>
                    </label>
                  </div> 
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="GI_Stomach_Adult" value="E094"/>
                      <span class="checkContent">E094 Gastric</span>
                    </label>
                  </div>                                                                     
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Heart_Adult" >Heart <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Heart_Adult" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Heart_Adult" class="panel-collapse collapse"> 
              <div id="Heart_Adult" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Heart_Adult" value="E104"/>
                      <span class="checkContent">E104 Right Atrium</span>
                    </label>
                  </div>   
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Heart_Adult" value="E095"/>
                      <span class="checkContent">E095 Left Ventricle</span>
                    </label>
                  </div> 
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Heart_Adult" value="E105"/>
                      <span class="checkContent">E105 Right Ventricle</span>
                    </label>
                  </div>                                                                     
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Liver_Adult" >Liver <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Liver_Adult" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Liver_Adult" class="panel-collapse collapse"> 
              <div id="Liver_Adult" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Liver_Adult" value="E066"/>
                      <span class="checkContent">E066 Liver</span>
                    </label>
                  </div>                                                                        
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Lung_Adult" >Lung <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Lung_Adult" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Lung_Adult" class="panel-collapse collapse"> 
              <div id="Lung_Adult" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Lung_Adult" value="E096"/>
                      <span class="checkContent">E096 Lung</span>
                    </label>
                  </div>                                                                        
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Muscle_Adult" >Muscle <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Muscle_Adult" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Muscle_Adult" class="panel-collapse collapse"> 
              <div id="Muscle_Adult" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Muscle_Adult" value="E100"/>
                      <span class="checkContent">E100 Psoas Muscle</span>
                    </label>
                  </div> 
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Muscle_Adult" value="E108"/>
                      <span class="checkContent">E108 Skeletal Muscle Female</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Muscle_Adult" value="E107"/>
                      <span class="checkContent">E107 Skeletal Muscle Male</span>
                    </label>
                  </div>                                                                                                           
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Ovary_Adult" >Ovary <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Ovary_Adult" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Ovary_Adult" class="panel-collapse collapse"> 
              <div id="Ovary_Adult" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Ovary_Adult" value="E097"/>
                      <span class="checkContent">E097 Ovary</span>
                    </label>
                  </div>                                                                                                            
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Pancreas_Adult" >Pancreas <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Pancreas_Adult" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Pancreas_Adult" class="panel-collapse collapse"> 
              <div id="Pancreas_Adult" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Pancreas_Adult" value="E087"/>
                      <span class="checkContent">E087 Pancreatic Islets</span>
                    </label>
                  </div>   
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Pancreas_Adult" value="E098"/>
                      <span class="checkContent">E098 Pancreas</span>
                    </label>
                  </div>                                                                                                                           
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Spleen_Adult" >Spleen <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Spleen_Adult" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Spleen_Adult" class="panel-collapse collapse"> 
              <div id="Spleen_Adult" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Spleen_Adult" value="E113"/>
                      <span class="checkContent">E113 Spleen</span>
                    </label>
                  </div>                                                                                                                             
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Thymus_Adult" >Thymus <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Thymus_Adult" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Thymus_Adult" class="panel-collapse collapse"> 
              <div id="Thymus_Adult" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Thymus_Adult" value="E112"/>
                      <span class="checkContent">E112 Thymus</span>
                    </label>
                  </div>                                                                                                                             
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Vascular_Adult" >Vascular <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Vascular_Adult" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Vascular_Adult" class="panel-collapse collapse"> 
              <div id="Vascular_Adult" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Vascular_Adult" value="E065"/>
                      <span class="checkContent">E065 Aorta</span>
                    </label>
                  </div>                                                                                                                             
                </div>
              </div> 
            </div>
        </div>


      </div> 
    </div>


    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title title_pos1">          
          <a data-toggle="collapse" href="#collapse_Fetal_Tissue"> Fetal Cells/Tissues <span class="caret"></span></a>
        </h4>
      </div>   
    <div id="collapse_Fetal_Tissue" class="panel-collapse collapse">


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Adrenal_Fetal" >Adrenal <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Adrenal_Fetal" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Adrenal_Fetal" class="panel-collapse collapse"> 
              <div id="Adrenal_Fetal" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Adrenal_Fetal" value="E080"/>
                      <span class="checkContent">E080 Fetal Adrenal Gland</span>
                    </label>
                  </div>                                                                                                                             
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Blood_Fetal" >Blood <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Blood_Fetal" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Blood_Fetal" class="panel-collapse collapse"> 
              <div id="Blood_Fetal" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Fetal" value="E033"/>
                      <span class="checkContent">E033 Primary T cells from cord blood</span>
                    </label>
                  </div>  
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Fetal" value="E031"/>
                      <span class="checkContent">E031 Primary B cells from cord blood</span>
                    </label>
                  </div>                                                                                                                                            
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Brain_Fetal" >Brain <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Brain_Fetal" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Brain_Fetal" class="panel-collapse collapse"> 
              <div id="Brain_Fetal" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Brain_Fetal" value="E070"/>
                      <span class="checkContent">E070 Brain Germinal Matrix</span>
                    </label>
                  </div>  
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Brain_Fetal" value="E082"/>
                      <span class="checkContent">E082 Fetal Brain Female</span>
                    </label>
                  </div>   
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Brain_Fetal" value="E081"/>
                      <span class="checkContent">E081 Fetal Brain Male</span>
                    </label>
                  </div>                                                                                                                                                             
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_GI_Intestine_Fetal" >GI_Intestine <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_GI_Intestine_Fetal" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_GI_Intestine_Fetal" class="panel-collapse collapse"> 
              <div id="GI_Intestine_Fetal" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="GI_Intestine_Fetal" value="E085"/>
                      <span class="checkContent">E085 Fetal Intestine Small</span>
                    </label>
                  </div>  
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="GI_Intestine_Fetal" value="E084"/>
                      <span class="checkContent">E084 Fetal Intestine Large</span>
                    </label>
                  </div>                                                                                                                                                               
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_GI_Stomach_Fetal" >GI_Stomach <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_GI_Stomach_Fetal" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_GI_Stomach_Fetal" class="panel-collapse collapse"> 
              <div id="GI_Stomach_Fetal" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="GI_Stomach_Fetal" value="E092"/>
                      <span class="checkContent">E092 Fetal Stomach</span>
                    </label>
                  </div>                                                                                                                                                                
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Heart_Fetal" >Heart <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Heart_Fetal" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Heart_Fetal" class="panel-collapse collapse"> 
              <div id="Heart_Fetal" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Heart_Fetal" value="E083"/>
                      <span class="checkContent">E083 Fetal Heart</span>
                    </label>
                  </div>                                                                                                                                                                
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Kidney_Fetal" >Kidney <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Kidney_Fetal" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Kidney_Fetal" class="panel-collapse collapse"> 
              <div id="Kidney_Fetal" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Kidney_Fetal" value="E086"/>
                      <span class="checkContent">E086 Fetal Kidney</span>
                    </label>
                  </div>                                                                                                                                                                
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Lung_Fetal" >Lung <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Lung_Fetal" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Lung_Fetal" class="panel-collapse collapse"> 
              <div id="Lung_Fetal" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Lung_Fetal" value="E088"/>
                      <span class="checkContent">E088 Fetal Lung</span>
                    </label>
                  </div>                                                                                                                                                                
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Muscle_Fetal" >Muscle <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Muscle_Fetal" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Muscle_Fetal" class="panel-collapse collapse"> 
              <div id="Muscle_Fetal" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Muscle_Fetal" value="E089"/>
                      <span class="checkContent">E089 Fetal Muscle Trunk</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Muscle_Fetal" value="E090"/>
                      <span class="checkContent">E090 Fetal Muscle Leg</span>
                    </label>
                  </div>                                                                                                                                                                                  
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href= "#collapse_Placenta_Fetal" >Placenta <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Placenta_Fetal" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Placenta_Fetal" class="panel-collapse collapse"> 
              <div id="Placenta_Fetal" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Placenta_Fetal" value="E099"/>
                      <span class="checkContent">E099 Placenta Amnion</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Placenta_Fetal" value="E091"/>
                      <span class="checkContent">E091 Placenta</span>
                    </label>
                  </div>                                                                                                                                                                                  
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Thymus_Fetal" >Thymus <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Thymus_Fetal" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Thymus_Fetal" class="panel-collapse collapse"> 
              <div id="Thymus_Fetal" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Thymus_Fetal" value="E093"/>
                      <span class="checkContent">E093 Fetal Thymus</span>
                    </label>
                  </div>                                                                                                                                                                                  
                </div>
              </div> 
            </div>
        </div>                        

                                                
      </div> 
    </div>


    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title title_pos1">          
          <a data-toggle="collapse" href="#collapse_Culture"> Primary Culture <span class="caret"></span></a>
        </h4>
      </div>   
    <div id="collapse_Culture" class="panel-collapse collapse">


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Blood_Culture" >Blood <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Blood_Culture" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Blood_Culture" class="panel-collapse collapse"> 
              <div id="Blood_Culture" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Culture" value="E116"/>
                      <span class="checkContent">E116 GM12878 Lymphoblastoid Cells</span>
                    </label>
                  </div>  
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Culture" value="E123"/>
                      <span class="checkContent">E123 K562 Leukemia Cells</span>
                    </label>
                  </div>                                                                                                                                              
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Bone_Culture" >Bone <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Bone_Culture" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Bone_Culture" class="panel-collapse collapse"> 
              <div id="Bone_Culture" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Bone_Culture" value="E129"/>
                      <span class="checkContent">E129 Osteoblast Primary Cells</span>
                    </label>
                  </div>                                                                                                                                               
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Brain_Culture" >Brain <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Brain_Culture" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Brain_Culture" class="panel-collapse collapse"> 
              <div id="Brain_Culture" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Brain_Culture" value="E054"/>
                      <span class="checkContent">E054 Ganglion Eminence derived primary cultured neurospheres</span>
                    </label>
                  </div>   
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Brain_Culture" value="E053"/>
                      <span class="checkContent">E053 Cortex derived primary cultured neurospheres</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Brain_Culture" value="E125"/>
                      <span class="checkContent">E125 NH-A Astrocytes Primary Cells</span>
                    </label>
                  </div>                                                                                                                                                                                
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Breast_Culture" >Breast <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Breast_Culture" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Breast_Culture" class="panel-collapse collapse"> 
              <div id="Breast_Culture" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Breast_Culture" value="E028"/>
                      <span class="checkContent">E028 Breast variant Human Mammary Epithelial Cells (vHMEC)</span>
                    </label>
                  </div>   
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Breast_Culture" value="E119"/>
                      <span class="checkContent">E119 HMEC Mammary Epithelial Primary Cells</span>
                    </label>
                  </div>                                                                                                                                                                                
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_ESC_Culture" >ESC <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_ESC_Culture" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_ESC_Culture" class="panel-collapse collapse"> 
              <div id="ESC_Culture" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="ESC_Culture" value="E002"/>
                      <span class="checkContent">E002 ES-WA7 Cells</span>
                    </label>
                  </div>   
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="ESC_Culture" value="E008"/>
                      <span class="checkContent">E008 H9 Cells</span>
                    </label>
                  </div>  
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="ESC_Culture" value="E001"/>
                      <span class="checkContent">E001 ES-I3 Cells</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="ESC_Culture" value="E015"/>
                      <span class="checkContent">E015 HUES6 Cells</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="ESC_Culture" value="E014"/>
                      <span class="checkContent">E014 HUES48 Cells</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="ESC_Culture" value="E016"/>
                      <span class="checkContent">E016 HUES64 Cells</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="ESC_Culture" value="E003"/>
                      <span class="checkContent">E003 H1 Cells</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="ESC_Culture" value="E024"/>
                      <span class="checkContent">E024 ES-UCSF4  Cells</span>
                    </label>
                  </div>                                                                                                                                                                                                
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_ESC_Derived_Culture" >ESC_Derived <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_ESC_Derived_Culture" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_ESC_Derived_Culture" class="panel-collapse collapse"> 
              <div id="ESC_Derived_Culture" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="ESC_Derived_Culture" value="E007"/>
                      <span class="checkContent">E007 H1 Derived Neuronal Progenitor Cultured Cells</span>
                    </label>
                  </div>   
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="ESC_Derived_Culture" value="E009"/>
                      <span class="checkContent">E009 H9 Derived Neuronal Progenitor Cultured Cells</span>
                    </label>
                  </div>  
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="ESC_Derived_Culture" value="E010"/>
                      <span class="checkContent">E010 H9 Derived Neuron Cultured Cells</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="ESC_Derived_Culture" value="E013"/>
                      <span class="checkContent">E013 hESC Derived CD56+ Mesoderm Cultured Cells</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="ESC_Derived_Culture" value="E012"/>
                      <span class="checkContent">E012 hESC Derived CD56+ Ectoderm Cultured Cells</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="ESC_Derived_Culture" value="E011"/>
                      <span class="checkContent">E011 hESC Derived CD184+ Endoderm Cultured Cells</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="ESC_Derived_Culture" value="E004"/>
                      <span class="checkContent">E004 H1 BMP4 Derived Mesendoderm Cultured Cells</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="ESC_Derived_Culture" value="E005"/>
                      <span class="checkContent">E005 H1 BMP4 Derived Trophoblast Cultured Cells</span>
                    </label>
                  </div>   
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="ESC_Derived_Culture" value="E006"/>
                      <span class="checkContent">E006 H1 Derived Mesenchymal Stem Cells</span>
                    </label>
                  </div>                                                                                                                                                                                                               
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Fat_Culture" >Fat <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Fat_Culture" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Fat_Culture" class="panel-collapse collapse"> 
              <div id="Fat_Culture" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Fat_Culture" value="E025"/>
                      <span class="checkContent">E025 Adipose Derived Mesenchymal Stem Cell Cultured Cells</span>
                    </label>
                  </div>   
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Fat_Culture" value="E023"/>
                      <span class="checkContent">E023 Mesenchymal Stem Cell Derived Adipocyte Cultured Cells</span>
                    </label>
                  </div>                                                                                                                                                                                                                 
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_IPSC_Culture" >IPSC <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_IPSC_Culture" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_IPSC_Culture" class="panel-collapse collapse"> 
              <div id="IPSC_Culture" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="IPSC_Culture" value="E020"/>
                      <span class="checkContent">E020 iPS-20b Cells</span>
                    </label>
                  </div>   
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="IPSC_Culture" value="E019"/>
                      <span class="checkContent">E019 iPS-18 Cells</span>
                    </label>
                  </div>  
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="IPSC_Culture" value="E018"/>
                      <span class="checkContent">E018 iPS-15b Cells</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="IPSC_Culture" value="E021"/>
                      <span class="checkContent">E021 iPS DF 6.9 Cells</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="IPSC_Culture" value="E022"/>
                      <span class="checkContent">E022 iPS DF 19.11 Cells</span>
                    </label>
                  </div>                                                                                                                                                                                                              
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Lung_Culture" >Lung <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Lung_Culture" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Lung_Culture" class="panel-collapse collapse"> 
              <div id="Lung_Culture" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Lung_Culture" value="E128"/>
                      <span class="checkContent">E128 NHLF Lung Fibroblast Primary Cells</span>
                    </label>
                  </div>                                                                                                                                                                                                                
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Muscle_Culture" >Muscle <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Muscle_Culture" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Muscle_Culture" class="panel-collapse collapse"> 
              <div id="Muscle_Culture" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Muscle_Culture" value="E052"/>
                      <span class="checkContent">E052 Muscle Satellite Cultured Cells</span>
                    </label>
                  </div>   
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Muscle_Culture" value="E120"/>
                      <span class="checkContent">E120 HSMM Skeletal Muscle Myoblasts Cells</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Muscle_Culture" value="E121"/>
                      <span class="checkContent">E121 HSMM cell derived Skeletal Muscle Myotubes Cells</span>
                    </label>
                  </div>                                                                                                                                                                                                                               
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Skin_Culture" >Skin <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Skin_Culture" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Skin_Culture" class="panel-collapse collapse"> 
              <div id="Skin_Culture" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Skin_Culture" value="E055"/>
                      <span class="checkContent">E055 Foreskin Fibroblast Primary Cells skin01</span>
                    </label>
                  </div>   
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Skin_Culture" value="E056"/>
                      <span class="checkContent">E056 Foreskin Fibroblast Primary Cells skin02</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Skin_Culture" value="E059"/>
                      <span class="checkContent">E059 Foreskin Melanocyte Primary Cells skin01</span>
                    </label>
                  </div> 
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Skin_Culture" value="E061"/>
                      <span class="checkContent">E061 Foreskin Melanocyte Primary Cells skin03</span>
                    </label>
                  </div>   
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Skin_Culture" value="E057"/>
                      <span class="checkContent">E057 Foreskin Keratinocyte Primary Cells skin02</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Skin_Culture" value="E058"/>
                      <span class="checkContent">E058 Foreskin Keratinocyte Primary Cells skin03</span>
                    </label>
                  </div> 
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Skin_Culture" value="E126"/>
                      <span class="checkContent">E126 NHDF-Ad Adult Dermal Fibroblast Primary Cells</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Skin_Culture" value="E127"/>
                      <span class="checkContent">E127 NHEK-Epidermal Keratinocyte Primary Cells</span>
                    </label>
                  </div>                                                                                                                                                                                                                                                                 
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Stromal_Connective_Culture" >Stromal_Connective <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Stromal_Connective_Culture" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Stromal_Connective_Culture" class="panel-collapse collapse"> 
              <div id="Stromal_Connective_Culture" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Stromal_Connective_Culture" value="E026"/>
                      <span class="checkContent">E026 Bone Marrow Derived Cultured Mesenchymal Stem Cells</span>
                    </label>
                  </div>   
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Stromal_Connective_Culture" value="E049"/>
                      <span class="checkContent">E049 Mesenchymal Stem Cell Derived Chondrocyte Cultured Cells</span>
                    </label>
                  </div>                                                                                                                                                                                                                                                                
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Vascular_Culture" >Vascular <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Vascular_Culture" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Vascular_Culture" class="panel-collapse collapse"> 
              <div id="Vascular_Culture" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Vascular_Culture" value="E122"/>
                      <span class="checkContent">E122 HUVEC Umbilical Vein Endothelial Primary Cells</span>
                    </label>
                  </div>                                                                                                                                                                                                                                                                  
                </div>
              </div> 
            </div>
        </div>                                                                                        


      </div> 
    </div>


    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title title_pos1">          
          <a data-toggle="collapse" href="#collapse_CellLine"> Cell Line <span class="caret"></span></a>
        </h4>
      </div>   
    <div id="collapse_CellLine" class="panel-collapse collapse">


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Blood_CellLine" >Blood <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Blood_CellLine" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Blood_CellLine" class="panel-collapse collapse"> 
              <div id="Blood_CellLine" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_CellLine" value="E115"/>
                      <span class="checkContent">E115 Dnd41 TCell Leukemia Cell Line</span>
                    </label>
                  </div>                                                                                                                                                
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Cervix_CellLine" >Cervix <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Cervix_CellLine" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Cervix_CellLine" class="panel-collapse collapse"> 
              <div id="Cervix_CellLine" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Cervix_CellLine" value="E117"/>
                      <span class="checkContent">E117 HeLa-S3 Cervical Carcinoma Cell Line</span>
                    </label>
                  </div>                                                                                                                                                
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Liver_CellLine" >Liver <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Liver_CellLine" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Liver_CellLine" class="panel-collapse collapse"> 
              <div id="Liver_CellLine" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Liver_CellLine" value="E118"/>
                      <span class="checkContent">E118 HepG2 Hepatocellular Carcinoma Cell Line</span>
                    </label>
                  </div>                                                                                                                                                
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Lung_CellLine" >Lung <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Lung_CellLine" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Lung_CellLine" class="panel-collapse collapse"> 
              <div id="Lung_CellLine" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Lung_CellLine" value="E017"/>
                      <span class="checkContent">E017 IMR90 fetal lung fibroblasts Cell Line</span>
                    </label>
                  </div>  
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Lung_CellLine" value="E114"/>
                      <span class="checkContent">E114 A549 EtOH 0.02pct Lung Carcinoma Cell Line</span>
                    </label>
                  </div>                                                                                                                                                                
                </div>
              </div> 
            </div>
        </div>                


      </div> 
    </div>


  </div>
 
')),
conditionalPanel(condition = "input.selectHMM == '18 model'",
    HTML('
  <br>
  <label>select samples:</label>
  <span class="tab"></span> <button id="selectAll_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
  <br>
  '),
  HTML('

  <br>
  <div class="panel-group">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title title_pos1">          
          <a data-toggle="collapse" href="#collapse_Adult_Tissue_18"> Adult Cells/Tissues <span class="caret"></span></a>
        </h4>
      </div>   
    <div id="collapse_Adult_Tissue_18" class="panel-collapse collapse">


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Blood_Adult_18" >Blood <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Blood_Adult_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>        
            <div id="collapse_Blood_Adult_18" class="panel-collapse collapse"> 
              <div id="Blood_Adult_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult_18" value="E062"/>
                      <span class="checkContent">E062 Primary mononuclear cells from peripheral blood</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult_18" value="E034"/>
                      <span class="checkContent">E034 Primary T cells from peripheral blood</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult_18" value="E045"/>
                      <span class="checkContent">E045 Primary T cells effector/memory enriched from peripheral blood</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult_18" value="E044"/>
                      <span class="checkContent">E044 Primary T regulatory cells from peripheral blood</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult_18" value="E043"/>
                      <span class="checkContent">E043 Primary T helper cells from peripheral blood</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult_18" value="E039"/>
                      <span class="checkContent">E039 Primary T helper naive cells from peripheral blood</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult_18" value="E041"/>
                      <span class="checkContent">E041 Primary T helper cells PMA-I stimulated</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult_18" value="E042"/>
                      <span class="checkContent">E042 Primary T helper 17 cells PMA-I stimulated</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult_18" value="E040"/>
                      <span class="checkContent">E040 Primary T helper memory cells from peripheral blood 1</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult_18" value="E037"/>
                      <span class="checkContent">E037 Primary T helper memory cells from peripheral blood 2</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult_18" value="E048"/>
                      <span class="checkContent">E048 Primary T CD8+ memory cells from peripheral blood</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult_18" value="E038"/>
                      <span class="checkContent">E038 Primary T helper naive cells from peripheral blood</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult_18" value="E047"/>
                      <span class="checkContent">E047 Primary T CD8+ naive cells from peripheral blood</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult_18" value="E029"/>
                      <span class="checkContent">E029 Primary monocytes from peripheral blood</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult_18" value="E050"/>
                      <span class="checkContent">E050 Primary hematopoietic stem cells G-CSF-mobilized Female</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult_18" value="E032"/>
                      <span class="checkContent">E032 Primary B cells from peripheral blood</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult_18" value="E046"/>
                      <span class="checkContent">E046 Primary Natural Killer cells from peripheral blood</span>
                    </label>
                  </div>  
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Adult_18" value="E124"/>
                      <span class="checkContent">E124 Monocytes-CD14+ RO01746 Primary Cells</span>
                    </label>
                  </div>                                                                                                                                                                                                                                                                                                 
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Brain_Adult_18" >Brain <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Brain_Adult_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>        
            <div id="collapse_Brain_Adult_18" class="panel-collapse collapse"> 
              <div id="Brain_Adult_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Brain_Adult_18" value="E071"/>
                      <span class="checkContent">E071 Brain Hippocampus Middle</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Brain_Adult_18" value="E074"/>
                      <span class="checkContent">E074 Brain Substantia Nigra</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Brain_Adult_18" value="E068"/>
                      <span class="checkContent">E068 Brain Anterior Caudate</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Brain_Adult_18" value="E069"/>
                      <span class="checkContent">E069 Brain Cingulate Gyrus</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Brain_Adult_18" value="E072"/>
                      <span class="checkContent">E072 Brain Inferior Temporal Lobe</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Brain_Adult_18" value="E067"/>
                      <span class="checkContent">E067 Brain Angular Gyrus</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Brain_Adult_18" value="E073"/>
                      <span class="checkContent">E073 Brain_Dorsolateral_Prefrontal_Cortex</span>
                    </label>
                  </div>                 
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Fat_Adult_18" >Fat <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Fat_Adult_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Fat_Adult_18" class="panel-collapse collapse"> 
              <div id="Fat_Adult_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Fat_Adult_18" value="E063"/>
                      <span class="checkContent">E063 Adipose Nuclei</span>
                    </label>
                  </div>
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_GI_Colon_Adult_18" >GI_Colon <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_GI_Colon_Adult_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_GI_Colon_Adult_18" class="panel-collapse collapse"> 
              <div id="GI_Colon_Adult_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="GI_Colon_Adult_18" value="E076"/>
                      <span class="checkContent">E076 Colon Smooth Muscle</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="GI_Colon_Adult_18" value="E106"/>
                      <span class="checkContent">E106 Sigmoid Colon</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="GI_Colon_Adult_18" value="E075"/>
                      <span class="checkContent">E075 Colonic Mucosa</span>
                    </label>
                  </div>                                    
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_GI_Duodenum_Adult_18" >GI_Duodenum <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_GI_Duodenum_Adult_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_GI_Duodenum_Adult_18" class="panel-collapse collapse"> 
              <div id="GI_Duodenum_Adult_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="GI_Duodenum_Adult_18" value="E078"/>
                      <span class="checkContent">E078 Duodenu</span>
                    </label>
                  </div>                                   
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_GI_Esophagus_Adult_18" >GI_Esophagus <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_GI_Esophagus_Adult_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_GI_Esophagus_Adult_18" class="panel-collapse collapse"> 
              <div id="GI_Esophagus_Adult_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="GI_Esophagus_Adult_18" value="E079"/>
                      <span class="checkContent">E079 Esophagus</span>
                    </label>
                  </div>                                   
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_GI_Intestine_Adult_18" >GI_Intestine <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_GI_Intestine_Adult_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_GI_Intestine_Adult_18" class="panel-collapse collapse"> 
              <div id="GI_Intestine_Adult_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="GI_Intestine_Adult_18" value="E109"/>
                      <span class="checkContent">E109 Small Intestin</span>
                    </label>
                  </div>                                   
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_GI_Rectum_Adult_18" >GI_Rectum <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_GI_Rectum_Adult_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_GI_Rectum_Adult_18" class="panel-collapse collapse"> 
              <div id="GI_Rectum_Adult_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="GI_Rectum_Adult_18" value="E103"/>
                      <span class="checkContent">E103 Rectal Smooth Muscle</span>
                    </label>
                  </div>   
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="GI_Rectum_Adult_18" value="E101"/>
                      <span class="checkContent">E101 Rectal Mucosa Donor 29</span>
                    </label>
                  </div> 
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="GI_Rectum_Adult_18" value="E102"/>
                      <span class="checkContent">E102 Rectal Mucosa Donor 31</span>
                    </label>
                  </div>                                                                     
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_GI_Stomach_Adult_18" >GI_Stomach <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_GI_Stomach_Adult_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_GI_Stomach_Adult_18" class="panel-collapse collapse"> 
              <div id="GI_Stomach_Adult_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="GI_Stomach_Adult_18" value="E111"/>
                      <span class="checkContent">E111 Stomach Smooth Muscle</span>
                    </label>
                  </div>   
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="GI_Stomach_Adult_18" value="E094"/>
                      <span class="checkContent">E094 Gastric</span>
                    </label>
                  </div>                                                                     
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Heart_Adult_18" >Heart <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Heart_Adult_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Heart_Adult_18" class="panel-collapse collapse"> 
              <div id="Heart_Adult_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Heart_Adult_18" value="E104"/>
                      <span class="checkContent">E104 Right Atrium</span>
                    </label>
                  </div>   
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Heart_Adult_18" value="E095"/>
                      <span class="checkContent">E095 Left Ventricle</span>
                    </label>
                  </div> 
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Heart_Adult_18" value="E105"/>
                      <span class="checkContent">E105 Right Ventricle</span>
                    </label>
                  </div>                                                                     
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Liver_Adult_18" >Liver <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Liver_Adult_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Liver_Adult_18" class="panel-collapse collapse"> 
              <div id="Liver_Adult_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Liver_Adult_18" value="E066"/>
                      <span class="checkContent">E066 Liver</span>
                    </label>
                  </div>                                                                        
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Lung_Adult_18" >Lung <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Lung_Adult_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Lung_Adult_18" class="panel-collapse collapse"> 
              <div id="Lung_Adult_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Lung_Adult_18" value="E096"/>
                      <span class="checkContent">E096 Lung</span>
                    </label>
                  </div>                                                                        
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Muscle_Adult_18" >Muscle <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Muscle_Adult_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Muscle_Adult_18" class="panel-collapse collapse"> 
              <div id="Muscle_Adult_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Muscle_Adult_18" value="E100"/>
                      <span class="checkContent">E100 Psoas Muscle</span>
                    </label>
                  </div> 
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Muscle_Adult_18" value="E108"/>
                      <span class="checkContent">E108 Skeletal Muscle Female</span>
                    </label>
                  </div>                                                                                                          
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Ovary_Adult_18" >Ovary <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Ovary_Adult_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Ovary_Adult_18" class="panel-collapse collapse"> 
              <div id="Ovary_Adult_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Ovary_Adult_18" value="E097"/>
                      <span class="checkContent">E097 Ovary</span>
                    </label>
                  </div>                                                                                                            
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Pancreas_Adult_18" >Pancreas <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Pancreas_Adult_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Pancreas_Adult_18" class="panel-collapse collapse"> 
              <div id="Pancreas_Adult_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Pancreas_Adult_18" value="E087"/>
                      <span class="checkContent">E087 Pancreatic Islets</span>
                    </label>
                  </div>   
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Pancreas_Adult_18" value="E098"/>
                      <span class="checkContent">E098 Pancreas</span>
                    </label>
                  </div>                                                                                                                           
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Spleen_Adult_18" >Spleen <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Spleen_Adult_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Spleen_Adult_18" class="panel-collapse collapse"> 
              <div id="Spleen_Adult_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Spleen_Adult_18" value="E113"/>
                      <span class="checkContent">E113 Spleen</span>
                    </label>
                  </div>                                                                                                                             
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Thymus_Adult_18" >Thymus <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Thymus_Adult_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Thymus_Adult_18" class="panel-collapse collapse"> 
              <div id="Thymus_Adult_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Thymus_Adult_18" value="E112"/>
                      <span class="checkContent">E112 Thymus</span>
                    </label>
                  </div>                                                                                                                             
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Vascular_Adult_18" >Vascular <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Vascular_Adult_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Vascular_Adult_18" class="panel-collapse collapse"> 
              <div id="Vascular_Adult_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Vascular_Adult_18" value="E065"/>
                      <span class="checkContent">E065 Aorta</span>
                    </label>
                  </div>                                                                                                                             
                </div>
              </div> 
            </div>
        </div>


      </div> 
    </div>


    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title title_pos1">          
          <a data-toggle="collapse" href="#collapse_Fetal_Tissue_18"> Fetal Cells/Tissues <span class="caret"></span></a>
        </h4>
      </div>   
    <div id="collapse_Fetal_Tissue_18" class="panel-collapse collapse">


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Adrenal_Fetal_18" >Adrenal <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Adrenal_Fetal_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Adrenal_Fetal_18" class="panel-collapse collapse"> 
              <div id="Adrenal_Fetal_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Adrenal_Fetal_18" value="E080"/>
                      <span class="checkContent">E080 Fetal Adrenal Gland</span>
                    </label>
                  </div>                                                                                                                             
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_GI_Intestine_Fetal_18" >GI_Intestine <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_GI_Intestine_Fetal_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_GI_Intestine_Fetal_18" class="panel-collapse collapse"> 
              <div id="GI_Intestine_Fetal_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="GI_Intestine_Fetal_18" value="E085"/>
                      <span class="checkContent">E085 Fetal Intestine Small</span>
                    </label>
                  </div>  
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="GI_Intestine_Fetal_18" value="E084"/>
                      <span class="checkContent">E084 Fetal Intestine Large</span>
                    </label>
                  </div>                                                                                                                                                               
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_GI_Stomach_Fetal_18" >GI_Stomach <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_GI_Stomach_Fetal_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_GI_Stomach_Fetal_18" class="panel-collapse collapse"> 
              <div id="GI_Stomach_Fetal_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="GI_Stomach_Fetal_18" value="E092"/>
                      <span class="checkContent">E092 Fetal Stomach</span>
                    </label>
                  </div>                                                                                                                                                                
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Muscle_Fetal_18" >Muscle <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Muscle_Fetal_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Muscle_Fetal_18" class="panel-collapse collapse"> 
              <div id="Muscle_Fetal_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Muscle_Fetal_18" value="E089"/>
                      <span class="checkContent">E089 Fetal Muscle Trunk</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Muscle_Fetal_18" value="E090"/>
                      <span class="checkContent">E090 Fetal Muscle Leg</span>
                    </label>
                  </div>                                                                                                                                                                                  
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href= "#collapse_Placenta_Fetal_18" >Placenta <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Placenta_Fetal_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Placenta_Fetal_18" class="panel-collapse collapse"> 
              <div id="Placenta_Fetal_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Placenta_Fetal_18" value="E099"/>
                      <span class="checkContent">E099 Placenta Amnion</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Placenta_Fetal_18" value="E091"/>
                      <span class="checkContent">E091 Placenta</span>
                    </label>
                  </div>                                                                                                                                                                                  
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Thymus_Fetal_18" >Thymus <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Thymus_Fetal_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Thymus_Fetal_18" class="panel-collapse collapse"> 
              <div id="Thymus_Fetal_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Thymus_Fetal_18" value="E093"/>
                      <span class="checkContent">E093 Fetal Thymus</span>
                    </label>
                  </div>                                                                                                                                                                                  
                </div>
              </div> 
            </div>
        </div>                        

                                                
      </div> 
    </div>


    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title title_pos1">          
          <a data-toggle="collapse" href="#collapse_Culture_18"> Primary Culture <span class="caret"></span></a>
        </h4>
      </div>   
    <div id="collapse_Culture_18" class="panel-collapse collapse">


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Blood_Culture_18" >Blood <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Blood_Culture_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Blood_Culture_18" class="panel-collapse collapse"> 
              <div id="Blood_Culture_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Culture_18" value="E116"/>
                      <span class="checkContent">E116 GM12878 Lymphoblastoid Cells</span>
                    </label>
                  </div>  
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_Culture_18" value="E123"/>
                      <span class="checkContent">E123 K562 Leukemia Cells</span>
                    </label>
                  </div>                                                                                                                                              
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Bone_Culture_18" >Bone <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Bone_Culture_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Bone_Culture_18" class="panel-collapse collapse"> 
              <div id="Bone_Culture_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Bone_Culture_18" value="E129"/>
                      <span class="checkContent">E129 Osteoblast Primary Cells</span>
                    </label>
                  </div>                                                                                                                                               
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Brain_Culture_18" >Brain <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Brain_Culture_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Brain_Culture_18" class="panel-collapse collapse"> 
              <div id="Brain_Culture_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">  
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Brain_Culture_18" value="E125"/>
                      <span class="checkContent">E125 NH-A Astrocytes Primary Cells</span>
                    </label>
                  </div>                                                                                                                                                                                
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Breast_Culture_18" >Breast <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Breast_Culture_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Breast_Culture_18" class="panel-collapse collapse"> 
              <div id="Breast_Culture_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">   
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Breast_Culture_18" value="E119"/>
                      <span class="checkContent">E119 HMEC Mammary Epithelial Primary Cells</span>
                    </label>
                  </div>                                                                                                                                                                                
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_ESC_Culture_18" >ESC <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_ESC_Culture_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_ESC_Culture_18" class="panel-collapse collapse"> 
              <div id="ESC_Culture_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">  
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="ESC_Culture_18" value="E008"/>
                      <span class="checkContent">E008 H9 Cells</span>
                    </label>
                  </div>  
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="ESC_Culture_18" value="E015"/>
                      <span class="checkContent">E015 HUES6 Cells</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="ESC_Culture_18" value="E014"/>
                      <span class="checkContent">E014 HUES48 Cells</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="ESC_Culture_18" value="E016"/>
                      <span class="checkContent">E016 HUES64 Cells</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="ESC_Culture_18" value="E003"/>
                      <span class="checkContent">E003 H1 Cells</span>
                    </label>
                  </div>                                                                                                                                                                                               
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_ESC_Derived_Culture_18" >ESC_Derived <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_ESC_Derived_Culture_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_ESC_Derived_Culture_18" class="panel-collapse collapse"> 
              <div id="ESC_Derived_Culture_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="ESC_Derived_Culture_18" value="E007"/>
                      <span class="checkContent">E007 H1 Derived Neuronal Progenitor Cultured Cells</span>
                    </label>
                  </div>     
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="ESC_Derived_Culture_18" value="E013"/>
                      <span class="checkContent">E013 hESC Derived CD56+ Mesoderm Cultured Cells</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="ESC_Derived_Culture_18" value="E012"/>
                      <span class="checkContent">E012 hESC Derived CD56+ Ectoderm Cultured Cells</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="ESC_Derived_Culture_18" value="E011"/>
                      <span class="checkContent">E011 hESC Derived CD184+ Endoderm Cultured Cells</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="ESC_Derived_Culture_18" value="E004"/>
                      <span class="checkContent">E004 H1 BMP4 Derived Mesendoderm Cultured Cells</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="ESC_Derived_Culture_18" value="E005"/>
                      <span class="checkContent">E005 H1 BMP4 Derived Trophoblast Cultured Cells</span>
                    </label>
                  </div>   
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="ESC_Derived_Culture_18" value="E006"/>
                      <span class="checkContent">E006 H1 Derived Mesenchymal Stem Cells</span>
                    </label>
                  </div>                                                                                                                                                                                                               
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_IPSC_Culture_18" >IPSC <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_IPSC_Culture_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_IPSC_Culture_18" class="panel-collapse collapse"> 
              <div id="IPSC_Culture_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="IPSC_Culture_18" value="E020"/>
                      <span class="checkContent">E020 iPS-20b Cells</span>
                    </label>
                  </div>   
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="IPSC_Culture_18" value="E019"/>
                      <span class="checkContent">E019 iPS-18 Cells</span>
                    </label>
                  </div>  
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="IPSC_Culture_18" value="E021"/>
                      <span class="checkContent">E021 iPS DF 6.9 Cells</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="IPSC_Culture_18" value="E022"/>
                      <span class="checkContent">E022 iPS DF 19.11 Cells</span>
                    </label>
                  </div>                                                                                                                                                                                                              
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Lung_Culture_18" >Lung <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Lung_Culture_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Lung_Culture_18" class="panel-collapse collapse"> 
              <div id="Lung_Culture_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Lung_Culture_18" value="E128"/>
                      <span class="checkContent">E128 NHLF Lung Fibroblast Primary Cells</span>
                    </label>
                  </div>                                                                                                                                                                                                                
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Muscle_Culture_18" >Muscle <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Muscle_Culture_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Muscle_Culture_18" class="panel-collapse collapse"> 
              <div id="Muscle_Culture_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">  
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Muscle_Culture_18" value="E120"/>
                      <span class="checkContent">E120 HSMM Skeletal Muscle Myoblasts Cells</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Muscle_Culture_18" value="E121"/>
                      <span class="checkContent">E121 HSMM cell derived Skeletal Muscle Myotubes Cells</span>
                    </label>
                  </div>                                                                                                                                                                                                                               
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Skin_Culture_18" >Skin <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Skin_Culture_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Skin_Culture_18" class="panel-collapse collapse"> 
              <div id="Skin_Culture_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Skin_Culture_18" value="E055"/>
                      <span class="checkContent">E055 Foreskin Fibroblast Primary Cells skin01</span>
                    </label>
                  </div>   
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Skin_Culture_18" value="E056"/>
                      <span class="checkContent">E056 Foreskin Fibroblast Primary Cells skin02</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Skin_Culture_18" value="E059"/>
                      <span class="checkContent">E059 Foreskin Melanocyte Primary Cells skin01</span>
                    </label>
                  </div> 
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Skin_Culture_18" value="E061"/>
                      <span class="checkContent">E061 Foreskin Melanocyte Primary Cells skin03</span>
                    </label>
                  </div>   
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Skin_Culture_18" value="E058"/>
                      <span class="checkContent">E058 Foreskin Keratinocyte Primary Cells skin03</span>
                    </label>
                  </div> 
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Skin_Culture_18" value="E126"/>
                      <span class="checkContent">E126 NHDF-Ad Adult Dermal Fibroblast Primary Cells</span>
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Skin_Culture_18" value="E127"/>
                      <span class="checkContent">E127 NHEK-Epidermal Keratinocyte Primary Cells</span>
                    </label>
                  </div>                                                                                                                                                                                                                                                                 
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Stromal_Connective_Culture_18" >Stromal_Connective <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Stromal_Connective_Culture_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Stromal_Connective_Culture_18" class="panel-collapse collapse"> 
              <div id="Stromal_Connective_Culture_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Stromal_Connective_Culture_18" value="E026"/>
                      <span class="checkContent">E026 Bone Marrow Derived Cultured Mesenchymal Stem Cells</span>
                    </label>
                  </div>   
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Stromal_Connective_Culture_18" value="E049"/>
                      <span class="checkContent">E049 Mesenchymal Stem Cell Derived Chondrocyte Cultured Cells</span>
                    </label>
                  </div>                                                                                                                                                                                                                                                                
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Vascular_Culture_18" >Vascular <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Vascular_Culture_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Vascular_Culture_18" class="panel-collapse collapse"> 
              <div id="Vascular_Culture_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Vascular_Culture_18" value="E122"/>
                      <span class="checkContent">E122 HUVEC Umbilical Vein Endothelial Primary Cells</span>
                    </label>
                  </div>                                                                                                                                                                                                                                                                  
                </div>
              </div> 
            </div>
        </div>                                                                                        


      </div> 
    </div>


    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title title_pos1">          
          <a data-toggle="collapse" href="#collapse_CellLine_18"> Cell Line <span class="caret"></span></a>
        </h4>
      </div>   
    <div id="collapse_CellLine_18" class="panel-collapse collapse">


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Blood_CellLine_18" >Blood <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Blood_CellLine_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Blood_CellLine_18" class="panel-collapse collapse"> 
              <div id="Blood_CellLine_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Blood_CellLine_18" value="E115"/>
                      <span class="checkContent">E115 Dnd41 TCell Leukemia Cell Line</span>
                    </label>
                  </div>                                                                                                                                                
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Cervix_CellLine_18" >Cervix <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Cervix_CellLine_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Cervix_CellLine_18" class="panel-collapse collapse"> 
              <div id="Cervix_CellLine_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Cervix_CellLine_18" value="E117"/>
                      <span class="checkContent">E117 HeLa-S3 Cervical Carcinoma Cell Line</span>
                    </label>
                  </div>                                                                                                                                                
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Liver_CellLine_18" >Liver <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Liver_CellLine_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Liver_CellLine_18" class="panel-collapse collapse"> 
              <div id="Liver_CellLine_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Liver_CellLine_18" value="E118"/>
                      <span class="checkContent">E118 HepG2 Hepatocellular Carcinoma Cell Line</span>
                    </label>
                  </div>                                                                                                                                                
                </div>
              </div> 
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title title_pos2">
                <a data-toggle="collapse" href="#collapse_Lung_CellLine_18" >Lung <span class="caret"></span></a>
                <span class="tab"></span> <button id="select_Lung_CellLine_18" type="button" class="btn btn1 btn-default action-button"><span class="selectButton"> select/deselect all </span></button>
              </h4>
            </div>
            <div id="collapse_Lung_CellLine_18" class="panel-collapse collapse"> 
              <div id="Lung_CellLine_18" class="form-group shiny-input-checkboxgroup shiny-input-container" >
                <div class="shiny-options-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Lung_CellLine_18" value="E017"/>
                      <span class="checkContent">E017 IMR90 fetal lung fibroblasts Cell Line</span>
                    </label>
                  </div>  
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="Lung_CellLine_18" value="E114"/>
                      <span class="checkContent">E114 A549 EtOH 0.02pct Lung Carcinoma Cell Line</span>
                    </label>
                  </div>                                                                                                                                                                
                </div>
              </div> 
            </div>
        </div>                


      </div> 
    </div>


  </div>
 
'))),

  column(4,HTML('  
  <p> 
  <br>
  <button id="selectFore" type="button" class="btn btn2 btn-default action-button" ><label>mark as foreground samples:</label></button>
  <pre id="summary1" class="shiny-text-output"></pre>
  <button id="selectBack" type="button" class="btn btn2 btn-default action-button"><label>mark as background samples:</label></button>
  <pre id="summary2" class="shiny-text-output"></pre>
  </p>
  <br>'))
  ),



  selectInput("selectState", "select enhancer or promoter:",
            c("enhancer" ,
              "promoter" )
            ),

  selectInput("selectMethod", "select method:",
            c("cutoff" = "cutoff",
              "fisher exact test" = "fisher",
              "clustering"="cluster"
              
              )
            ),
  conditionalPanel(condition = "input.selectMethod == 'cutoff'",
        numericInput("foreCutoff", "minimal foreground cutoff:", 0.8,
             min = 0, step=0.05, max = 1),
        numericInput("backCutoff", "maximal background cutoff:", 0.2,
             min = 0, step=0.05, max = 1)
    ),

  conditionalPanel(condition = "input.selectMethod == 'fisher'",
        numericInput("fisherCutoff", "q value for fisher test:", 0.01,
             min = 0, step=0.01, max = 1)
    ),

  conditionalPanel(condition = "input.selectMethod == 'cluster'",
          selectInput("selectClusterMethod", "select mean or median to calculate average density of foreground and background samples:",
            c("median" ,
              "mean" )
            ),
        numericInput("clusterCutoff", "minimal average density for foreground samples:", 0.4,
             min = 0, step=0.1, max = 1),
        numericInput("clusterRatio", "minimal difference for average density ratio between foreground and background samples:", 2,
             min = 1, step=1, max = 10)
    ),

  singleton(tags$head(HTML(
'
  <script type="text/javascript">
    $(document).ready(function() {
      // disable download at startup. data_file is the id of the downloadButton
      $("#data_file").attr("disabled", "true").attr("onclick", "return false;");

      Shiny.addCustomMessageHandler("download_ready", function(message) {
        $("#data_file").removeAttr("disabled").removeAttr("onclick").html(
          "<i class=\\"fa fa-download\\"></i>Download");
      });
    })
  </script>
'
))),
    #panel for submit and output
  hr(),
  fluidRow(column(3,offset=0,actionButton(inputId = 'submit',label='Submit'))),
  fluidRow(column(3,offset=0,conditionalPanel(condition="$('html').hasClass('shiny-busy')",
                 tags$div("Processing...",id="process_message")))),
  downloadButton('data_file', 'Download'),
  helpText("Download will be available once the processing is completed."),
  #fluidRow(column(3,offset=0,conditionalPanel(condition="!$('html').hasClass('shiny-busy')",downloadButton('downloadData', 'Download')))),
  HTML('<br><br><br>'),
  fluidRow(tableOutput('table'))


          ),  #end of one tabPanel

    tabPanel(
"H3K27ac","To be built")
  
) #end of tabsetPanel
)
)

require(data.table)
enhancer_logic_15 <- as.data.frame(fread('ChromHMM18_enh_logic_test2'))
promoter_logic_15 <- as.data.frame(fread('ChromHMM18_enh_logic_test'))
enhancer_logic_18 <- as.data.frame(fread('ChromHMM18_enh_logic_test2'))
promoter_logic_18 <- as.data.frame(fread('ChromHMM18_enh_logic_test'))
cluster_all_15 <- as.data.frame(fread('all_cluster_ChromHMM15'))
len_all <- dim(cluster_all_15)[2]
cluster_all_15_last <- cluster_all_15[,len_all]
cluster_density_15 <- as.data.frame(fread('cluster_density_ChromHMM15'))

server<-function(input, output,session) {

#feature1 update
#select all
        observe({
        if (input$selectAll > 0) {
          if (input$selectAll %% 2 == 1){
updateCheckboxGroupInput(session=session, inputId="Blood_Culture", choices=list("E116 GM12878 Lymphoblastoid Cells" ="E116","E123 K562 Leukemia Cells" ="E123"), selected= c("E116","E123"))
updateCheckboxGroupInput(session=session, inputId="Bone_Culture", choices=list("E129 Osteoblast Primary Cells" ="E129"), selected= c("E129"))
updateCheckboxGroupInput(session=session, inputId="Brain_Culture", choices=list("E054 Ganglion Eminence derived primary cultured neurospheres" ="E054","E053 Cortex derived primary cultured neurospheres" ="E053","E125 NH-A Astrocytes Primary Cells" ="E125"), selected= c("E054","E053","E125"))
updateCheckboxGroupInput(session=session, inputId="Breast_Culture", choices=list("E028 Breast variant Human Mammary Epithelial Cells (vHMEC)" ="E028","E119 HMEC Mammary Epithelial Primary Cells" ="E119"), selected= c("E028","E119"))
updateCheckboxGroupInput(session=session, inputId="ESC_Culture", choices=list("E002 ES-WA7 Cells" ="E002","E008 H9 Cells" ="E008","E001 ES-I3 Cells" ="E001","E015 HUES6 Cells" ="E015","E014 HUES48 Cells" ="E014","E016 HUES64 Cells" ="E016","E003 H1 Cells" ="E003","E024 ES-UCSF4  Cells" ="E024"), selected= c("E002","E008","E001","E015","E014","E016","E003","E024"))
updateCheckboxGroupInput(session=session, inputId="ESC_Derived_Culture", choices=list("E007 H1 Derived Neuronal Progenitor Cultured Cells" ="E007","E009 H9 Derived Neuronal Progenitor Cultured Cells" ="E009","E010 H9 Derived Neuron Cultured Cells" ="E010","E013 hESC Derived CD56+ Mesoderm Cultured Cells" ="E013","E012 hESC Derived CD56+ Ectoderm Cultured Cells" ="E012","E011 hESC Derived CD184+ Endoderm Cultured Cells" ="E011","E004 H1 BMP4 Derived Mesendoderm Cultured Cells" ="E004","E005 H1 BMP4 Derived Trophoblast Cultured Cells" ="E005","E006 H1 Derived Mesenchymal Stem Cells" ="E006"), selected= c("E007","E009","E010","E013","E012","E011","E004","E005","E006"))
updateCheckboxGroupInput(session=session, inputId="Fat_Culture", choices=list("E025 Adipose Derived Mesenchymal Stem Cell Cultured Cells" ="E025","E023 Mesenchymal Stem Cell Derived Adipocyte Cultured Cells" ="E023"), selected= c("E025","E023"))
updateCheckboxGroupInput(session=session, inputId="IPSC_Culture", choices=list("E020 iPS-20b Cells" ="E020","E019 iPS-18 Cells" ="E019","E018 iPS-15b Cells" ="E018","E021 iPS DF 6.9 Cells" ="E021","E022 iPS DF 19.11 Cells" ="E022"), selected= c("E020","E019","E018","E021","E022"))
updateCheckboxGroupInput(session=session, inputId="Lung_Culture", choices=list("E128 NHLF Lung Fibroblast Primary Cells" ="E128"), selected= c("E128"))
updateCheckboxGroupInput(session=session, inputId="Muscle_Culture", choices=list("E052 Muscle Satellite Cultured Cells" ="E052","E120 HSMM Skeletal Muscle Myoblasts Cells" ="E120","E121 HSMM cell derived Skeletal Muscle Myotubes Cells" ="E121"), selected= c("E052","E120","E121"))
updateCheckboxGroupInput(session=session, inputId="Skin_Culture", choices=list("E055 Foreskin Fibroblast Primary Cells skin01" ="E055","E056 Foreskin Fibroblast Primary Cells skin02" ="E056","E059 Foreskin Melanocyte Primary Cells skin01" ="E059","E061 Foreskin Melanocyte Primary Cells skin03" ="E061","E057 Foreskin Keratinocyte Primary Cells skin02" ="E057","E058 Foreskin Keratinocyte Primary Cells skin03" ="E058","E126 NHDF-Ad Adult Dermal Fibroblast Primary Cells" ="E126","E127 NHEK-Epidermal Keratinocyte Primary Cells" ="E127"), selected= c("E055","E056","E059","E061","E057","E058","E126","E127"))
updateCheckboxGroupInput(session=session, inputId="Stromal_Connective_Culture", choices=list("E026 Bone Marrow Derived Cultured Mesenchymal Stem Cells" ="E026","E049 Mesenchymal Stem Cell Derived Chondrocyte Cultured Cells" ="E049"), selected= c("E026","E049"))
updateCheckboxGroupInput(session=session, inputId="Vascular_Culture", choices=list("E122 HUVEC Umbilical Vein Endothelial Primary Cells" ="E122"), selected= c("E122"))
updateCheckboxGroupInput(session=session, inputId="Blood_Adult", choices=list("E062 Primary mononuclear cells from peripheral blood" ="E062","E034 Primary T cells from peripheral blood" ="E034","E045 Primary T cells effector/memory enriched from peripheral blood" ="E045","E044 Primary T regulatory cells from peripheral blood" ="E044","E043 Primary T helper cells from peripheral blood" ="E043","E039 Primary T helper naive cells from peripheral blood" ="E039","E041 Primary T helper cells PMA-I stimulated" ="E041","E042 Primary T helper 17 cells PMA-I stimulated" ="E042","E040 Primary T helper memory cells from peripheral blood 1" ="E040","E037 Primary T helper memory cells from peripheral blood 2" ="E037","E048 Primary T CD8+ memory cells from peripheral blood" ="E048","E038 Primary T helper naive cells from peripheral blood" ="E038","E047 Primary T CD8+ naive cells from peripheral blood" ="E047","E029 Primary monocytes from peripheral blood" ="E029","E035 Primary hematopoietic stem cells" ="E035","E051 Primary hematopoietic stem cells G-CSF-mobilized Male" ="E051","E050 Primary hematopoietic stem cells G-CSF-mobilized Female" ="E050","E036 Primary hematopoietic stem cells short term culture" ="E036","E032 Primary B cells from peripheral blood" ="E032","E046 Primary Natural Killer cells from peripheral blood" ="E046","E030 Primary neutrophils from peripheral blood" ="E030","E124 Monocytes-CD14+ RO01746 Primary Cells" ="E124"), selected= c("E062","E034","E045","E044","E043","E039","E041","E042","E040","E037","E048","E038","E047","E029","E035","E051","E050","E036","E032","E046","E030","E124"))
updateCheckboxGroupInput(session=session, inputId="Brain_Adult", choices=list("E071 Brain Hippocampus Middle" ="E071","E074 Brain Substantia Nigra" ="E074","E068 Brain Anterior Caudate" ="E068","E069 Brain Cingulate Gyrus" ="E069","E072 Brain Inferior Temporal Lobe" ="E072","E067 Brain Angular Gyrus" ="E067","E073 Brain_Dorsolateral_Prefrontal_Cortex" ="E073"), selected= c("E071","E074","E068","E069","E072","E067","E073"))
updateCheckboxGroupInput(session=session, inputId="Breast_Adult", choices=list("E027 Breast Myoepithelial Primary Cells" ="E027"), selected= c("E027"))
updateCheckboxGroupInput(session=session, inputId="Fat_Adult", choices=list("E063 Adipose Nuclei" ="E063"), selected= c("E063"))
updateCheckboxGroupInput(session=session, inputId="GI_Colon_Adult", choices=list("E076 Colon Smooth Muscle" ="E076","E106 Sigmoid Colon" ="E106","E075 Colonic Mucosa" ="E075"), selected= c("E076","E106","E075"))
updateCheckboxGroupInput(session=session, inputId="GI_Duodenum_Adult", choices=list("E078 Duodenum Smooth Muscle" ="E078","E077 Duodenum Mucosa" ="E077"), selected= c("E078","E077"))
updateCheckboxGroupInput(session=session, inputId="GI_Esophagus_Adult", choices=list("E079 Esophagus" ="E079"), selected= c("E079"))
updateCheckboxGroupInput(session=session, inputId="GI_Intestine_Adult", choices=list("E109 Small Intestine" ="E109"), selected= c("E109"))
updateCheckboxGroupInput(session=session, inputId="GI_Rectum_Adult", choices=list("E103 Rectal Smooth Muscle" ="E103","E101 Rectal Mucosa Donor 29" ="E101","E102 Rectal Mucosa Donor 31" ="E102"), selected= c("E103","E101","E102"))
updateCheckboxGroupInput(session=session, inputId="GI_Stomach_Adult", choices=list("E111 Stomach Smooth Muscle" ="E111","E110 Stomach Mucosa" ="E110","E094 Gastric" ="E094"), selected= c("E111","E110","E094"))
updateCheckboxGroupInput(session=session, inputId="Heart_Adult", choices=list("E104 Right Atrium" ="E104","E095 Left Ventricle" ="E095","E105 Right Ventricle" ="E105"), selected= c("E104","E095","E105"))
updateCheckboxGroupInput(session=session, inputId="Liver_Adult", choices=list("E066 Liver" ="E066"), selected= c("E066"))
updateCheckboxGroupInput(session=session, inputId="Lung_Adult", choices=list("E096 Lung" ="E096"), selected= c("E096"))
updateCheckboxGroupInput(session=session, inputId="Muscle_Adult", choices=list("E100 Psoas Muscle" ="E100","E108 Skeletal Muscle Female" ="E108","E107 Skeletal Muscle Male" ="E107"), selected= c("E100","E108","E107"))
updateCheckboxGroupInput(session=session, inputId="Ovary_Adult", choices=list("E097 Ovary" ="E097"), selected= c("E097"))
updateCheckboxGroupInput(session=session, inputId="Pancreas_Adult", choices=list("E087 Pancreatic Islets" ="E087","E098 Pancreas" ="E098"), selected= c("E087","E098"))
updateCheckboxGroupInput(session=session, inputId="Spleen_Adult", choices=list("E113 Spleen" ="E113"), selected= c("E113"))
updateCheckboxGroupInput(session=session, inputId="Thymus_Adult", choices=list("E112 Thymus" ="E112"), selected= c("E112"))
updateCheckboxGroupInput(session=session, inputId="Vascular_Adult", choices=list("E065 Aorta" ="E065"), selected= c("E065"))
updateCheckboxGroupInput(session=session, inputId="Adrenal_Fetal", choices=list("E080 Fetal Adrenal Gland" ="E080"), selected= c("E080"))
updateCheckboxGroupInput(session=session, inputId="Blood_Fetal", choices=list("E033 Primary T cells from cord blood" ="E033","E031 Primary B cells from cord blood" ="E031"), selected= c("E033","E031"))
updateCheckboxGroupInput(session=session, inputId="Brain_Fetal", choices=list("E070 Brain Germinal Matrix" ="E070","E082 Fetal Brain Female" ="E082","E081 Fetal Brain Male" ="E081"), selected= c("E070","E082","E081"))
updateCheckboxGroupInput(session=session, inputId="GI_Intestine_Fetal", choices=list("E085 Fetal Intestine Small" ="E085","E084 Fetal Intestine Large" ="E084"), selected= c("E085","E084"))
updateCheckboxGroupInput(session=session, inputId="GI_Stomach_Fetal", choices=list("E092 Fetal Stomach" ="E092"), selected= c("E092"))
updateCheckboxGroupInput(session=session, inputId="Heart_Fetal", choices=list("E083 Fetal Heart" ="E083"), selected= c("E083"))
updateCheckboxGroupInput(session=session, inputId="Kidney_Fetal", choices=list("E086 Fetal Kidney" ="E086"), selected= c("E086"))
updateCheckboxGroupInput(session=session, inputId="Lung_Fetal", choices=list("E088 Fetal Lung" ="E088"), selected= c("E088"))
updateCheckboxGroupInput(session=session, inputId="Muscle_Fetal", choices=list("E089 Fetal Muscle Trunk" ="E089","E090 Fetal Muscle Leg" ="E090"), selected= c("E089","E090"))
updateCheckboxGroupInput(session=session, inputId="Placenta_Fetal", choices=list("E099 Placenta Amnion" ="E099","E091 Placenta" ="E091"), selected= c("E099","E091"))
updateCheckboxGroupInput(session=session, inputId="Thymus_Fetal", choices=list("E093 Fetal Thymus" ="E093"), selected= c("E093"))
updateCheckboxGroupInput(session=session, inputId="Blood_CellLine", choices=list("E115 Dnd41 TCell Leukemia Cell Line" ="E115"), selected= c("E115"))
updateCheckboxGroupInput(session=session, inputId="Cervix_CellLine", choices=list("E117 HeLa-S3 Cervical Carcinoma Cell Line" ="E117"), selected= c("E117"))
updateCheckboxGroupInput(session=session, inputId="Liver_CellLine", choices=list("E118 HepG2 Hepatocellular Carcinoma Cell Line" ="E118"), selected= c("E118"))
updateCheckboxGroupInput(session=session, inputId="Lung_CellLine", choices=list("E017 IMR90 fetal lung fibroblasts Cell Line" ="E017","E114 A549 EtOH 0.02pct Lung Carcinoma Cell Line" ="E114"), selected= c("E017","E114"))                                                                          
          }
          else {
updateCheckboxGroupInput(session=session, inputId="Blood_Culture", choices=list("E116 GM12878 Lymphoblastoid Cells" ="E116","E123 K562 Leukemia Cells" ="E123"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Bone_Culture", choices=list("E129 Osteoblast Primary Cells" ="E129"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Brain_Culture", choices=list("E054 Ganglion Eminence derived primary cultured neurospheres" ="E054","E053 Cortex derived primary cultured neurospheres" ="E053","E125 NH-A Astrocytes Primary Cells" ="E125"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Breast_Culture", choices=list("E028 Breast variant Human Mammary Epithelial Cells (vHMEC)" ="E028","E119 HMEC Mammary Epithelial Primary Cells" ="E119"), selected= c())
updateCheckboxGroupInput(session=session, inputId="ESC_Culture", choices=list("E002 ES-WA7 Cells" ="E002","E008 H9 Cells" ="E008","E001 ES-I3 Cells" ="E001","E015 HUES6 Cells" ="E015","E014 HUES48 Cells" ="E014","E016 HUES64 Cells" ="E016","E003 H1 Cells" ="E003","E024 ES-UCSF4  Cells" ="E024"), selected= c())
updateCheckboxGroupInput(session=session, inputId="ESC_Derived_Culture", choices=list("E007 H1 Derived Neuronal Progenitor Cultured Cells" ="E007","E009 H9 Derived Neuronal Progenitor Cultured Cells" ="E009","E010 H9 Derived Neuron Cultured Cells" ="E010","E013 hESC Derived CD56+ Mesoderm Cultured Cells" ="E013","E012 hESC Derived CD56+ Ectoderm Cultured Cells" ="E012","E011 hESC Derived CD184+ Endoderm Cultured Cells" ="E011","E004 H1 BMP4 Derived Mesendoderm Cultured Cells" ="E004","E005 H1 BMP4 Derived Trophoblast Cultured Cells" ="E005","E006 H1 Derived Mesenchymal Stem Cells" ="E006"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Fat_Culture", choices=list("E025 Adipose Derived Mesenchymal Stem Cell Cultured Cells" ="E025","E023 Mesenchymal Stem Cell Derived Adipocyte Cultured Cells" ="E023"), selected= c())
updateCheckboxGroupInput(session=session, inputId="IPSC_Culture", choices=list("E020 iPS-20b Cells" ="E020","E019 iPS-18 Cells" ="E019","E018 iPS-15b Cells" ="E018","E021 iPS DF 6.9 Cells" ="E021","E022 iPS DF 19.11 Cells" ="E022"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Lung_Culture", choices=list("E128 NHLF Lung Fibroblast Primary Cells" ="E128"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Muscle_Culture", choices=list("E052 Muscle Satellite Cultured Cells" ="E052","E120 HSMM Skeletal Muscle Myoblasts Cells" ="E120","E121 HSMM cell derived Skeletal Muscle Myotubes Cells" ="E121"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Skin_Culture", choices=list("E055 Foreskin Fibroblast Primary Cells skin01" ="E055","E056 Foreskin Fibroblast Primary Cells skin02" ="E056","E059 Foreskin Melanocyte Primary Cells skin01" ="E059","E061 Foreskin Melanocyte Primary Cells skin03" ="E061","E057 Foreskin Keratinocyte Primary Cells skin02" ="E057","E058 Foreskin Keratinocyte Primary Cells skin03" ="E058","E126 NHDF-Ad Adult Dermal Fibroblast Primary Cells" ="E126","E127 NHEK-Epidermal Keratinocyte Primary Cells" ="E127"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Stromal_Connective_Culture", choices=list("E026 Bone Marrow Derived Cultured Mesenchymal Stem Cells" ="E026","E049 Mesenchymal Stem Cell Derived Chondrocyte Cultured Cells" ="E049"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Vascular_Culture", choices=list("E122 HUVEC Umbilical Vein Endothelial Primary Cells" ="E122"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Blood_Adult", choices=list("E062 Primary mononuclear cells from peripheral blood" ="E062","E034 Primary T cells from peripheral blood" ="E034","E045 Primary T cells effector/memory enriched from peripheral blood" ="E045","E044 Primary T regulatory cells from peripheral blood" ="E044","E043 Primary T helper cells from peripheral blood" ="E043","E039 Primary T helper naive cells from peripheral blood" ="E039","E041 Primary T helper cells PMA-I stimulated" ="E041","E042 Primary T helper 17 cells PMA-I stimulated" ="E042","E040 Primary T helper memory cells from peripheral blood 1" ="E040","E037 Primary T helper memory cells from peripheral blood 2" ="E037","E048 Primary T CD8+ memory cells from peripheral blood" ="E048","E038 Primary T helper naive cells from peripheral blood" ="E038","E047 Primary T CD8+ naive cells from peripheral blood" ="E047","E029 Primary monocytes from peripheral blood" ="E029","E035 Primary hematopoietic stem cells" ="E035","E051 Primary hematopoietic stem cells G-CSF-mobilized Male" ="E051","E050 Primary hematopoietic stem cells G-CSF-mobilized Female" ="E050","E036 Primary hematopoietic stem cells short term culture" ="E036","E032 Primary B cells from peripheral blood" ="E032","E046 Primary Natural Killer cells from peripheral blood" ="E046","E030 Primary neutrophils from peripheral blood" ="E030","E124 Monocytes-CD14+ RO01746 Primary Cells" ="E124"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Brain_Adult", choices=list("E071 Brain Hippocampus Middle" ="E071","E074 Brain Substantia Nigra" ="E074","E068 Brain Anterior Caudate" ="E068","E069 Brain Cingulate Gyrus" ="E069","E072 Brain Inferior Temporal Lobe" ="E072","E067 Brain Angular Gyrus" ="E067","E073 Brain_Dorsolateral_Prefrontal_Cortex" ="E073"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Breast_Adult", choices=list("E027 Breast Myoepithelial Primary Cells" ="E027"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Fat_Adult", choices=list("E063 Adipose Nuclei" ="E063"), selected= c())
updateCheckboxGroupInput(session=session, inputId="GI_Colon_Adult", choices=list("E076 Colon Smooth Muscle" ="E076","E106 Sigmoid Colon" ="E106","E075 Colonic Mucosa" ="E075"), selected= c())
updateCheckboxGroupInput(session=session, inputId="GI_Duodenum_Adult", choices=list("E078 Duodenum Smooth Muscle" ="E078","E077 Duodenum Mucosa" ="E077"), selected= c())
updateCheckboxGroupInput(session=session, inputId="GI_Esophagus_Adult", choices=list("E079 Esophagus" ="E079"), selected= c())
updateCheckboxGroupInput(session=session, inputId="GI_Intestine_Adult", choices=list("E109 Small Intestine" ="E109"), selected= c())
updateCheckboxGroupInput(session=session, inputId="GI_Rectum_Adult", choices=list("E103 Rectal Smooth Muscle" ="E103","E101 Rectal Mucosa Donor 29" ="E101","E102 Rectal Mucosa Donor 31" ="E102"), selected= c())
updateCheckboxGroupInput(session=session, inputId="GI_Stomach_Adult", choices=list("E111 Stomach Smooth Muscle" ="E111","E110 Stomach Mucosa" ="E110","E094 Gastric" ="E094"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Heart_Adult", choices=list("E104 Right Atrium" ="E104","E095 Left Ventricle" ="E095","E105 Right Ventricle" ="E105"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Liver_Adult", choices=list("E066 Liver" ="E066"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Lung_Adult", choices=list("E096 Lung" ="E096"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Muscle_Adult", choices=list("E100 Psoas Muscle" ="E100","E108 Skeletal Muscle Female" ="E108","E107 Skeletal Muscle Male" ="E107"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Ovary_Adult", choices=list("E097 Ovary" ="E097"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Pancreas_Adult", choices=list("E087 Pancreatic Islets" ="E087","E098 Pancreas" ="E098"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Spleen_Adult", choices=list("E113 Spleen" ="E113"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Thymus_Adult", choices=list("E112 Thymus" ="E112"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Vascular_Adult", choices=list("E065 Aorta" ="E065"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Adrenal_Fetal", choices=list("E080 Fetal Adrenal Gland" ="E080"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Blood_Fetal", choices=list("E033 Primary T cells from cord blood" ="E033","E031 Primary B cells from cord blood" ="E031"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Brain_Fetal", choices=list("E070 Brain Germinal Matrix" ="E070","E082 Fetal Brain Female" ="E082","E081 Fetal Brain Male" ="E081"), selected= c())
updateCheckboxGroupInput(session=session, inputId="GI_Intestine_Fetal", choices=list("E085 Fetal Intestine Small" ="E085","E084 Fetal Intestine Large" ="E084"), selected= c())
updateCheckboxGroupInput(session=session, inputId="GI_Stomach_Fetal", choices=list("E092 Fetal Stomach" ="E092"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Heart_Fetal", choices=list("E083 Fetal Heart" ="E083"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Kidney_Fetal", choices=list("E086 Fetal Kidney" ="E086"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Lung_Fetal", choices=list("E088 Fetal Lung" ="E088"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Muscle_Fetal", choices=list("E089 Fetal Muscle Trunk" ="E089","E090 Fetal Muscle Leg" ="E090"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Placenta_Fetal", choices=list("E099 Placenta Amnion" ="E099","E091 Placenta" ="E091"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Thymus_Fetal", choices=list("E093 Fetal Thymus" ="E093"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Blood_CellLine", choices=list("E115 Dnd41 TCell Leukemia Cell Line" ="E115"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Cervix_CellLine", choices=list("E117 HeLa-S3 Cervical Carcinoma Cell Line" ="E117"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Liver_CellLine", choices=list("E118 HepG2 Hepatocellular Carcinoma Cell Line" ="E118"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Lung_CellLine", choices=list("E017 IMR90 fetal lung fibroblasts Cell Line" ="E017","E114 A549 EtOH 0.02pct Lung Carcinoma Cell Line" ="E114"), selected= c())                                         
            }}
        })


#select all for each tissue
observe({ 
if (input$select_Blood_Culture > 0) { 
  if (input$select_Blood_Culture %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Blood_Culture", choices=list("E116 GM12878 Lymphoblastoid Cells" ="E116","E123 K562 Leukemia Cells" ="E123"), selected= c("E116","E123"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Blood_Culture", choices=list("E116 GM12878 Lymphoblastoid Cells" ="E116","E123 K562 Leukemia Cells" ="E123"), selected= c()) }} })
observe({ 
if (input$select_Bone_Culture > 0) { 
  if (input$select_Bone_Culture %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Bone_Culture", choices=list("E129 Osteoblast Primary Cells" ="E129"), selected= c("E129"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Bone_Culture", choices=list("E129 Osteoblast Primary Cells" ="E129"), selected= c()) }} })
observe({ 
if (input$select_Brain_Culture > 0) { 
  if (input$select_Brain_Culture %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Brain_Culture", choices=list("E054 Ganglion Eminence derived primary cultured neurospheres" ="E054","E053 Cortex derived primary cultured neurospheres" ="E053","E125 NH-A Astrocytes Primary Cells" ="E125"), selected= c("E054","E053","E125"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Brain_Culture", choices=list("E054 Ganglion Eminence derived primary cultured neurospheres" ="E054","E053 Cortex derived primary cultured neurospheres" ="E053","E125 NH-A Astrocytes Primary Cells" ="E125"), selected= c()) }} })
observe({ 
if (input$select_Breast_Culture > 0) { 
  if (input$select_Breast_Culture %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Breast_Culture", choices=list("E028 Breast variant Human Mammary Epithelial Cells (vHMEC)" ="E028","E119 HMEC Mammary Epithelial Primary Cells" ="E119"), selected= c("E028","E119"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Breast_Culture", choices=list("E028 Breast variant Human Mammary Epithelial Cells (vHMEC)" ="E028","E119 HMEC Mammary Epithelial Primary Cells" ="E119"), selected= c()) }} })
observe({ 
if (input$select_ESC_Culture > 0) { 
  if (input$select_ESC_Culture %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="ESC_Culture", choices=list("E002 ES-WA7 Cells" ="E002","E008 H9 Cells" ="E008","E001 ES-I3 Cells" ="E001","E015 HUES6 Cells" ="E015","E014 HUES48 Cells" ="E014","E016 HUES64 Cells" ="E016","E003 H1 Cells" ="E003","E024 ES-UCSF4  Cells" ="E024"), selected= c("E002","E008","E001","E015","E014","E016","E003","E024"))} 
  else { updateCheckboxGroupInput(session=session, inputId="ESC_Culture", choices=list("E002 ES-WA7 Cells" ="E002","E008 H9 Cells" ="E008","E001 ES-I3 Cells" ="E001","E015 HUES6 Cells" ="E015","E014 HUES48 Cells" ="E014","E016 HUES64 Cells" ="E016","E003 H1 Cells" ="E003","E024 ES-UCSF4  Cells" ="E024"), selected= c()) }} })
observe({ 
if (input$select_ESC_Derived_Culture > 0) { 
  if (input$select_ESC_Derived_Culture %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="ESC_Derived_Culture", choices=list("E007 H1 Derived Neuronal Progenitor Cultured Cells" ="E007","E009 H9 Derived Neuronal Progenitor Cultured Cells" ="E009","E010 H9 Derived Neuron Cultured Cells" ="E010","E013 hESC Derived CD56+ Mesoderm Cultured Cells" ="E013","E012 hESC Derived CD56+ Ectoderm Cultured Cells" ="E012","E011 hESC Derived CD184+ Endoderm Cultured Cells" ="E011","E004 H1 BMP4 Derived Mesendoderm Cultured Cells" ="E004","E005 H1 BMP4 Derived Trophoblast Cultured Cells" ="E005","E006 H1 Derived Mesenchymal Stem Cells" ="E006"), selected= c("E007","E009","E010","E013","E012","E011","E004","E005","E006"))} 
  else { updateCheckboxGroupInput(session=session, inputId="ESC_Derived_Culture", choices=list("E007 H1 Derived Neuronal Progenitor Cultured Cells" ="E007","E009 H9 Derived Neuronal Progenitor Cultured Cells" ="E009","E010 H9 Derived Neuron Cultured Cells" ="E010","E013 hESC Derived CD56+ Mesoderm Cultured Cells" ="E013","E012 hESC Derived CD56+ Ectoderm Cultured Cells" ="E012","E011 hESC Derived CD184+ Endoderm Cultured Cells" ="E011","E004 H1 BMP4 Derived Mesendoderm Cultured Cells" ="E004","E005 H1 BMP4 Derived Trophoblast Cultured Cells" ="E005","E006 H1 Derived Mesenchymal Stem Cells" ="E006"), selected= c()) }} })
observe({ 
if (input$select_Fat_Culture > 0) { 
  if (input$select_Fat_Culture %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Fat_Culture", choices=list("E025 Adipose Derived Mesenchymal Stem Cell Cultured Cells" ="E025","E023 Mesenchymal Stem Cell Derived Adipocyte Cultured Cells" ="E023"), selected= c("E025","E023"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Fat_Culture", choices=list("E025 Adipose Derived Mesenchymal Stem Cell Cultured Cells" ="E025","E023 Mesenchymal Stem Cell Derived Adipocyte Cultured Cells" ="E023"), selected= c()) }} })
observe({ 
if (input$select_IPSC_Culture > 0) { 
  if (input$select_IPSC_Culture %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="IPSC_Culture", choices=list("E020 iPS-20b Cells" ="E020","E019 iPS-18 Cells" ="E019","E018 iPS-15b Cells" ="E018","E021 iPS DF 6.9 Cells" ="E021","E022 iPS DF 19.11 Cells" ="E022"), selected= c("E020","E019","E018","E021","E022"))} 
  else { updateCheckboxGroupInput(session=session, inputId="IPSC_Culture", choices=list("E020 iPS-20b Cells" ="E020","E019 iPS-18 Cells" ="E019","E018 iPS-15b Cells" ="E018","E021 iPS DF 6.9 Cells" ="E021","E022 iPS DF 19.11 Cells" ="E022"), selected= c()) }} })
observe({ 
if (input$select_Lung_Culture > 0) { 
  if (input$select_Lung_Culture %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Lung_Culture", choices=list("E128 NHLF Lung Fibroblast Primary Cells" ="E128"), selected= c("E128"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Lung_Culture", choices=list("E128 NHLF Lung Fibroblast Primary Cells" ="E128"), selected= c()) }} })
observe({ 
if (input$select_Muscle_Culture > 0) { 
  if (input$select_Muscle_Culture %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Muscle_Culture", choices=list("E052 Muscle Satellite Cultured Cells" ="E052","E120 HSMM Skeletal Muscle Myoblasts Cells" ="E120","E121 HSMM cell derived Skeletal Muscle Myotubes Cells" ="E121"), selected= c("E052","E120","E121"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Muscle_Culture", choices=list("E052 Muscle Satellite Cultured Cells" ="E052","E120 HSMM Skeletal Muscle Myoblasts Cells" ="E120","E121 HSMM cell derived Skeletal Muscle Myotubes Cells" ="E121"), selected= c()) }} })
observe({ 
if (input$select_Skin_Culture > 0) { 
  if (input$select_Skin_Culture %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Skin_Culture", choices=list("E055 Foreskin Fibroblast Primary Cells skin01" ="E055","E056 Foreskin Fibroblast Primary Cells skin02" ="E056","E059 Foreskin Melanocyte Primary Cells skin01" ="E059","E061 Foreskin Melanocyte Primary Cells skin03" ="E061","E057 Foreskin Keratinocyte Primary Cells skin02" ="E057","E058 Foreskin Keratinocyte Primary Cells skin03" ="E058","E126 NHDF-Ad Adult Dermal Fibroblast Primary Cells" ="E126","E127 NHEK-Epidermal Keratinocyte Primary Cells" ="E127"), selected= c("E055","E056","E059","E061","E057","E058","E126","E127"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Skin_Culture", choices=list("E055 Foreskin Fibroblast Primary Cells skin01" ="E055","E056 Foreskin Fibroblast Primary Cells skin02" ="E056","E059 Foreskin Melanocyte Primary Cells skin01" ="E059","E061 Foreskin Melanocyte Primary Cells skin03" ="E061","E057 Foreskin Keratinocyte Primary Cells skin02" ="E057","E058 Foreskin Keratinocyte Primary Cells skin03" ="E058","E126 NHDF-Ad Adult Dermal Fibroblast Primary Cells" ="E126","E127 NHEK-Epidermal Keratinocyte Primary Cells" ="E127"), selected= c()) }} })
observe({ 
if (input$select_Stromal_Connective_Culture > 0) { 
  if (input$select_Stromal_Connective_Culture %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Stromal_Connective_Culture", choices=list("E026 Bone Marrow Derived Cultured Mesenchymal Stem Cells" ="E026","E049 Mesenchymal Stem Cell Derived Chondrocyte Cultured Cells" ="E049"), selected= c("E026","E049"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Stromal_Connective_Culture", choices=list("E026 Bone Marrow Derived Cultured Mesenchymal Stem Cells" ="E026","E049 Mesenchymal Stem Cell Derived Chondrocyte Cultured Cells" ="E049"), selected= c()) }} })
observe({ 
if (input$select_Vascular_Culture > 0) { 
  if (input$select_Vascular_Culture %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Vascular_Culture", choices=list("E122 HUVEC Umbilical Vein Endothelial Primary Cells" ="E122"), selected= c("E122"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Vascular_Culture", choices=list("E122 HUVEC Umbilical Vein Endothelial Primary Cells" ="E122"), selected= c()) }} })
observe({ 
if (input$select_Blood_Adult > 0) { 
  if (input$select_Blood_Adult %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Blood_Adult", choices=list("E062 Primary mononuclear cells from peripheral blood" ="E062","E034 Primary T cells from peripheral blood" ="E034","E045 Primary T cells effector/memory enriched from peripheral blood" ="E045","E044 Primary T regulatory cells from peripheral blood" ="E044","E043 Primary T helper cells from peripheral blood" ="E043","E039 Primary T helper naive cells from peripheral blood" ="E039","E041 Primary T helper cells PMA-I stimulated" ="E041","E042 Primary T helper 17 cells PMA-I stimulated" ="E042","E040 Primary T helper memory cells from peripheral blood 1" ="E040","E037 Primary T helper memory cells from peripheral blood 2" ="E037","E048 Primary T CD8+ memory cells from peripheral blood" ="E048","E038 Primary T helper naive cells from peripheral blood" ="E038","E047 Primary T CD8+ naive cells from peripheral blood" ="E047","E029 Primary monocytes from peripheral blood" ="E029","E035 Primary hematopoietic stem cells" ="E035","E051 Primary hematopoietic stem cells G-CSF-mobilized Male" ="E051","E050 Primary hematopoietic stem cells G-CSF-mobilized Female" ="E050","E036 Primary hematopoietic stem cells short term culture" ="E036","E032 Primary B cells from peripheral blood" ="E032","E046 Primary Natural Killer cells from peripheral blood" ="E046","E030 Primary neutrophils from peripheral blood" ="E030","E124 Monocytes-CD14+ RO01746 Primary Cells" ="E124"), selected= c("E062","E034","E045","E044","E043","E039","E041","E042","E040","E037","E048","E038","E047","E029","E035","E051","E050","E036","E032","E046","E030","E124"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Blood_Adult", choices=list("E062 Primary mononuclear cells from peripheral blood" ="E062","E034 Primary T cells from peripheral blood" ="E034","E045 Primary T cells effector/memory enriched from peripheral blood" ="E045","E044 Primary T regulatory cells from peripheral blood" ="E044","E043 Primary T helper cells from peripheral blood" ="E043","E039 Primary T helper naive cells from peripheral blood" ="E039","E041 Primary T helper cells PMA-I stimulated" ="E041","E042 Primary T helper 17 cells PMA-I stimulated" ="E042","E040 Primary T helper memory cells from peripheral blood 1" ="E040","E037 Primary T helper memory cells from peripheral blood 2" ="E037","E048 Primary T CD8+ memory cells from peripheral blood" ="E048","E038 Primary T helper naive cells from peripheral blood" ="E038","E047 Primary T CD8+ naive cells from peripheral blood" ="E047","E029 Primary monocytes from peripheral blood" ="E029","E035 Primary hematopoietic stem cells" ="E035","E051 Primary hematopoietic stem cells G-CSF-mobilized Male" ="E051","E050 Primary hematopoietic stem cells G-CSF-mobilized Female" ="E050","E036 Primary hematopoietic stem cells short term culture" ="E036","E032 Primary B cells from peripheral blood" ="E032","E046 Primary Natural Killer cells from peripheral blood" ="E046","E030 Primary neutrophils from peripheral blood" ="E030","E124 Monocytes-CD14+ RO01746 Primary Cells" ="E124"), selected= c()) }} })
observe({ 
if (input$select_Brain_Adult > 0) { 
  if (input$select_Brain_Adult %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Brain_Adult", choices=list("E071 Brain Hippocampus Middle" ="E071","E074 Brain Substantia Nigra" ="E074","E068 Brain Anterior Caudate" ="E068","E069 Brain Cingulate Gyrus" ="E069","E072 Brain Inferior Temporal Lobe" ="E072","E067 Brain Angular Gyrus" ="E067","E073 Brain_Dorsolateral_Prefrontal_Cortex" ="E073"), selected= c("E071","E074","E068","E069","E072","E067","E073"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Brain_Adult", choices=list("E071 Brain Hippocampus Middle" ="E071","E074 Brain Substantia Nigra" ="E074","E068 Brain Anterior Caudate" ="E068","E069 Brain Cingulate Gyrus" ="E069","E072 Brain Inferior Temporal Lobe" ="E072","E067 Brain Angular Gyrus" ="E067","E073 Brain_Dorsolateral_Prefrontal_Cortex" ="E073"), selected= c()) }} })
observe({ 
if (input$select_Breast_Adult > 0) { 
  if (input$select_Breast_Adult %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Breast_Adult", choices=list("E027 Breast Myoepithelial Primary Cells" ="E027"), selected= c("E027"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Breast_Adult", choices=list("E027 Breast Myoepithelial Primary Cells" ="E027"), selected= c()) }} })
observe({ 
if (input$select_Fat_Adult > 0) { 
  if (input$select_Fat_Adult %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Fat_Adult", choices=list("E063 Adipose Nuclei" ="E063"), selected= c("E063"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Fat_Adult", choices=list("E063 Adipose Nuclei" ="E063"), selected= c()) }} })
observe({ 
if (input$select_GI_Colon_Adult > 0) { 
  if (input$select_GI_Colon_Adult %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="GI_Colon_Adult", choices=list("E076 Colon Smooth Muscle" ="E076","E106 Sigmoid Colon" ="E106","E075 Colonic Mucosa" ="E075"), selected= c("E076","E106","E075"))} 
  else { updateCheckboxGroupInput(session=session, inputId="GI_Colon_Adult", choices=list("E076 Colon Smooth Muscle" ="E076","E106 Sigmoid Colon" ="E106","E075 Colonic Mucosa" ="E075"), selected= c()) }} })
observe({ 
if (input$select_GI_Duodenum_Adult > 0) { 
  if (input$select_GI_Duodenum_Adult %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="GI_Duodenum_Adult", choices=list("E078 Duodenum Smooth Muscle" ="E078","E077 Duodenum Mucosa" ="E077"), selected= c("E078","E077"))} 
  else { updateCheckboxGroupInput(session=session, inputId="GI_Duodenum_Adult", choices=list("E078 Duodenum Smooth Muscle" ="E078","E077 Duodenum Mucosa" ="E077"), selected= c()) }} })
observe({ 
if (input$select_GI_Esophagus_Adult > 0) { 
  if (input$select_GI_Esophagus_Adult %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="GI_Esophagus_Adult", choices=list("E079 Esophagus" ="E079"), selected= c("E079"))} 
  else { updateCheckboxGroupInput(session=session, inputId="GI_Esophagus_Adult", choices=list("E079 Esophagus" ="E079"), selected= c()) }} })
observe({ 
if (input$select_GI_Intestine_Adult > 0) { 
  if (input$select_GI_Intestine_Adult %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="GI_Intestine_Adult", choices=list("E109 Small Intestine" ="E109"), selected= c("E109"))} 
  else { updateCheckboxGroupInput(session=session, inputId="GI_Intestine_Adult", choices=list("E109 Small Intestine" ="E109"), selected= c()) }} })
observe({ 
if (input$select_GI_Rectum_Adult > 0) { 
  if (input$select_GI_Rectum_Adult %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="GI_Rectum_Adult", choices=list("E103 Rectal Smooth Muscle" ="E103","E101 Rectal Mucosa Donor 29" ="E101","E102 Rectal Mucosa Donor 31" ="E102"), selected= c("E103","E101","E102"))} 
  else { updateCheckboxGroupInput(session=session, inputId="GI_Rectum_Adult", choices=list("E103 Rectal Smooth Muscle" ="E103","E101 Rectal Mucosa Donor 29" ="E101","E102 Rectal Mucosa Donor 31" ="E102"), selected= c()) }} })
observe({ 
if (input$select_GI_Stomach_Adult > 0) { 
  if (input$select_GI_Stomach_Adult %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="GI_Stomach_Adult", choices=list("E111 Stomach Smooth Muscle" ="E111","E110 Stomach Mucosa" ="E110","E094 Gastric" ="E094"), selected= c("E111","E110","E094"))} 
  else { updateCheckboxGroupInput(session=session, inputId="GI_Stomach_Adult", choices=list("E111 Stomach Smooth Muscle" ="E111","E110 Stomach Mucosa" ="E110","E094 Gastric" ="E094"), selected= c()) }} })
observe({ 
if (input$select_Heart_Adult > 0) { 
  if (input$select_Heart_Adult %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Heart_Adult", choices=list("E104 Right Atrium" ="E104","E095 Left Ventricle" ="E095","E105 Right Ventricle" ="E105"), selected= c("E104","E095","E105"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Heart_Adult", choices=list("E104 Right Atrium" ="E104","E095 Left Ventricle" ="E095","E105 Right Ventricle" ="E105"), selected= c()) }} })
observe({ 
if (input$select_Liver_Adult > 0) { 
  if (input$select_Liver_Adult %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Liver_Adult", choices=list("E066 Liver" ="E066"), selected= c("E066"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Liver_Adult", choices=list("E066 Liver" ="E066"), selected= c()) }} })
observe({ 
if (input$select_Lung_Adult > 0) { 
  if (input$select_Lung_Adult %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Lung_Adult", choices=list("E096 Lung" ="E096"), selected= c("E096"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Lung_Adult", choices=list("E096 Lung" ="E096"), selected= c()) }} })
observe({ 
if (input$select_Muscle_Adult > 0) { 
  if (input$select_Muscle_Adult %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Muscle_Adult", choices=list("E100 Psoas Muscle" ="E100","E108 Skeletal Muscle Female" ="E108","E107 Skeletal Muscle Male" ="E107"), selected= c("E100","E108","E107"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Muscle_Adult", choices=list("E100 Psoas Muscle" ="E100","E108 Skeletal Muscle Female" ="E108","E107 Skeletal Muscle Male" ="E107"), selected= c()) }} })
observe({ 
if (input$select_Ovary_Adult > 0) { 
  if (input$select_Ovary_Adult %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Ovary_Adult", choices=list("E097 Ovary" ="E097"), selected= c("E097"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Ovary_Adult", choices=list("E097 Ovary" ="E097"), selected= c()) }} })
observe({ 
if (input$select_Pancreas_Adult > 0) { 
  if (input$select_Pancreas_Adult %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Pancreas_Adult", choices=list("E087 Pancreatic Islets" ="E087","E098 Pancreas" ="E098"), selected= c("E087","E098"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Pancreas_Adult", choices=list("E087 Pancreatic Islets" ="E087","E098 Pancreas" ="E098"), selected= c()) }} })
observe({ 
if (input$select_Spleen_Adult > 0) { 
  if (input$select_Spleen_Adult %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Spleen_Adult", choices=list("E113 Spleen" ="E113"), selected= c("E113"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Spleen_Adult", choices=list("E113 Spleen" ="E113"), selected= c()) }} })
observe({ 
if (input$select_Thymus_Adult > 0) { 
  if (input$select_Thymus_Adult %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Thymus_Adult", choices=list("E112 Thymus" ="E112"), selected= c("E112"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Thymus_Adult", choices=list("E112 Thymus" ="E112"), selected= c()) }} })
observe({ 
if (input$select_Vascular_Adult > 0) { 
  if (input$select_Vascular_Adult %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Vascular_Adult", choices=list("E065 Aorta" ="E065"), selected= c("E065"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Vascular_Adult", choices=list("E065 Aorta" ="E065"), selected= c()) }} })
observe({ 
if (input$select_Adrenal_Fetal > 0) { 
  if (input$select_Adrenal_Fetal %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Adrenal_Fetal", choices=list("E080 Fetal Adrenal Gland" ="E080"), selected= c("E080"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Adrenal_Fetal", choices=list("E080 Fetal Adrenal Gland" ="E080"), selected= c()) }} })
observe({ 
if (input$select_Blood_Fetal > 0) { 
  if (input$select_Blood_Fetal %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Blood_Fetal", choices=list("E033 Primary T cells from cord blood" ="E033","E031 Primary B cells from cord blood" ="E031"), selected= c("E033","E031"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Blood_Fetal", choices=list("E033 Primary T cells from cord blood" ="E033","E031 Primary B cells from cord blood" ="E031"), selected= c()) }} })
observe({ 
if (input$select_Brain_Fetal > 0) { 
  if (input$select_Brain_Fetal %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Brain_Fetal", choices=list("E070 Brain Germinal Matrix" ="E070","E082 Fetal Brain Female" ="E082","E081 Fetal Brain Male" ="E081"), selected= c("E070","E082","E081"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Brain_Fetal", choices=list("E070 Brain Germinal Matrix" ="E070","E082 Fetal Brain Female" ="E082","E081 Fetal Brain Male" ="E081"), selected= c()) }} })
observe({ 
if (input$select_GI_Intestine_Fetal > 0) { 
  if (input$select_GI_Intestine_Fetal %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="GI_Intestine_Fetal", choices=list("E085 Fetal Intestine Small" ="E085","E084 Fetal Intestine Large" ="E084"), selected= c("E085","E084"))} 
  else { updateCheckboxGroupInput(session=session, inputId="GI_Intestine_Fetal", choices=list("E085 Fetal Intestine Small" ="E085","E084 Fetal Intestine Large" ="E084"), selected= c()) }} })
observe({ 
if (input$select_GI_Stomach_Fetal > 0) { 
  if (input$select_GI_Stomach_Fetal %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="GI_Stomach_Fetal", choices=list("E092 Fetal Stomach" ="E092"), selected= c("E092"))} 
  else { updateCheckboxGroupInput(session=session, inputId="GI_Stomach_Fetal", choices=list("E092 Fetal Stomach" ="E092"), selected= c()) }} })
observe({ 
if (input$select_Heart_Fetal > 0) { 
  if (input$select_Heart_Fetal %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Heart_Fetal", choices=list("E083 Fetal Heart" ="E083"), selected= c("E083"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Heart_Fetal", choices=list("E083 Fetal Heart" ="E083"), selected= c()) }} })
observe({ 
if (input$select_Kidney_Fetal > 0) { 
  if (input$select_Kidney_Fetal %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Kidney_Fetal", choices=list("E086 Fetal Kidney" ="E086"), selected= c("E086"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Kidney_Fetal", choices=list("E086 Fetal Kidney" ="E086"), selected= c()) }} })
observe({ 
if (input$select_Lung_Fetal > 0) { 
  if (input$select_Lung_Fetal %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Lung_Fetal", choices=list("E088 Fetal Lung" ="E088"), selected= c("E088"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Lung_Fetal", choices=list("E088 Fetal Lung" ="E088"), selected= c()) }} })
observe({ 
if (input$select_Muscle_Fetal > 0) { 
  if (input$select_Muscle_Fetal %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Muscle_Fetal", choices=list("E089 Fetal Muscle Trunk" ="E089","E090 Fetal Muscle Leg" ="E090"), selected= c("E089","E090"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Muscle_Fetal", choices=list("E089 Fetal Muscle Trunk" ="E089","E090 Fetal Muscle Leg" ="E090"), selected= c()) }} })
observe({ 
if (input$select_Placenta_Fetal > 0) { 
  if (input$select_Placenta_Fetal %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Placenta_Fetal", choices=list("E099 Placenta Amnion" ="E099","E091 Placenta" ="E091"), selected= c("E099","E091"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Placenta_Fetal", choices=list("E099 Placenta Amnion" ="E099","E091 Placenta" ="E091"), selected= c()) }} })
observe({ 
if (input$select_Thymus_Fetal > 0) { 
  if (input$select_Thymus_Fetal %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Thymus_Fetal", choices=list("E093 Fetal Thymus" ="E093"), selected= c("E093"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Thymus_Fetal", choices=list("E093 Fetal Thymus" ="E093"), selected= c()) }} })
observe({ 
if (input$select_Blood_CellLine > 0) { 
  if (input$select_Blood_CellLine %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Blood_CellLine", choices=list("E115 Dnd41 TCell Leukemia Cell Line" ="E115"), selected= c("E115"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Blood_CellLine", choices=list("E115 Dnd41 TCell Leukemia Cell Line" ="E115"), selected= c()) }} })
observe({ 
if (input$select_Cervix_CellLine > 0) { 
  if (input$select_Cervix_CellLine %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Cervix_CellLine", choices=list("E117 HeLa-S3 Cervical Carcinoma Cell Line" ="E117"), selected= c("E117"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Cervix_CellLine", choices=list("E117 HeLa-S3 Cervical Carcinoma Cell Line" ="E117"), selected= c()) }} })
observe({ 
if (input$select_Liver_CellLine > 0) { 
  if (input$select_Liver_CellLine %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Liver_CellLine", choices=list("E118 HepG2 Hepatocellular Carcinoma Cell Line" ="E118"), selected= c("E118"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Liver_CellLine", choices=list("E118 HepG2 Hepatocellular Carcinoma Cell Line" ="E118"), selected= c()) }} })
observe({ 
if (input$select_Lung_CellLine > 0) { 
  if (input$select_Lung_CellLine %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Lung_CellLine", choices=list("E017 IMR90 fetal lung fibroblasts Cell Line" ="E017","E114 A549 EtOH 0.02pct Lung Carcinoma Cell Line" ="E114"), selected= c("E017","E114"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Lung_CellLine", choices=list("E017 IMR90 fetal lung fibroblasts Cell Line" ="E017","E114 A549 EtOH 0.02pct Lung Carcinoma Cell Line" ="E114"), selected= c()) }} })


#update if chosing chromHMM18 model
          observe({
        if (input$selectAll_18 > 0) {
          if (input$selectAll_18 %% 2 == 1){
updateCheckboxGroupInput(session=session, inputId="Blood_Culture_18", choices=list("E116 GM12878 Lymphoblastoid Cells" ="E116","E123 K562 Leukemia Cells" ="E123"), selected= c("E116","E123"))
updateCheckboxGroupInput(session=session, inputId="Bone_Culture_18", choices=list("E129 Osteoblast Primary Cells" ="E129"), selected= c("E129"))
updateCheckboxGroupInput(session=session, inputId="Brain_Culture_18", choices=list("E125 NH-A Astrocytes Primary Cells" ="E125"), selected= c("E125"))
updateCheckboxGroupInput(session=session, inputId="Breast_Culture_18", choices=list("E119 HMEC Mammary Epithelial Primary Cells" ="E119"), selected= c("E119"))
updateCheckboxGroupInput(session=session, inputId="ESC_Culture_18", choices=list("E008 H9 Cells" ="E008","E015 HUES6 Cells" ="E015","E014 HUES48 Cells" ="E014","E016 HUES64 Cells" ="E016","E003 H1 Cells" ="E003"), selected= c("E008","E015","E014","E016","E003"))
updateCheckboxGroupInput(session=session, inputId="ESC_Derived_Culture_18", choices=list("E007 H1 Derived Neuronal Progenitor Cultured Cells" ="E007","E013 hESC Derived CD56+ Mesoderm Cultured Cells" ="E013","E012 hESC Derived CD56+ Ectoderm Cultured Cells" ="E012","E011 hESC Derived CD184+ Endoderm Cultured Cells" ="E011","E004 H1 BMP4 Derived Mesendoderm Cultured Cells" ="E004","E005 H1 BMP4 Derived Trophoblast Cultured Cells" ="E005","E006 H1 Derived Mesenchymal Stem Cells" ="E006"), selected= c("E007","E013","E012","E011","E004","E005","E006"))
updateCheckboxGroupInput(session=session, inputId="IPSC_Culture_18", choices=list("E020 iPS-20b Cells" ="E020","E019 iPS-18 Cells" ="E019","E021 iPS DF 6.9 Cells" ="E021","E022 iPS DF 19.11 Cells" ="E022"), selected= c("E020","E019","E021","E022"))
updateCheckboxGroupInput(session=session, inputId="Lung_Culture_18", choices=list("E128 NHLF Lung Fibroblast Primary Cells" ="E128"), selected= c("E128"))
updateCheckboxGroupInput(session=session, inputId="Muscle_Culture_18", choices=list("E120 HSMM Skeletal Muscle Myoblasts Cells" ="E120","E121 HSMM cell derived Skeletal Muscle Myotubes Cells" ="E121"), selected= c("E120","E121"))
updateCheckboxGroupInput(session=session, inputId="Skin_Culture_18", choices=list("E055 Foreskin Fibroblast Primary Cells skin01" ="E055","E056 Foreskin Fibroblast Primary Cells skin02" ="E056","E059 Foreskin Melanocyte Primary Cells skin01" ="E059","E061 Foreskin Melanocyte Primary Cells skin03" ="E061","E058 Foreskin Keratinocyte Primary Cells skin03" ="E058","E126 NHDF-Ad Adult Dermal Fibroblast Primary Cells" ="E126","E127 NHEK-Epidermal Keratinocyte Primary Cells" ="E127"), selected= c("E055","E056","E059","E061","E058","E126","E127"))
updateCheckboxGroupInput(session=session, inputId="Stromal_Connective_Culture_18", choices=list("E026 Bone Marrow Derived Cultured Mesenchymal Stem Cells" ="E026","E049 Mesenchymal Stem Cell Derived Chondrocyte Cultured Cells" ="E049"), selected= c("E026","E049"))
updateCheckboxGroupInput(session=session, inputId="Vascular_Culture_18", choices=list("E122 HUVEC Umbilical Vein Endothelial Primary Cells" ="E122"), selected= c("E122"))
updateCheckboxGroupInput(session=session, inputId="Blood_Adult_18", choices=list("E062 Primary mononuclear cells from peripheral blood" ="E062","E034 Primary T cells from peripheral blood" ="E034","E045 Primary T cells effector/memory enriched from peripheral blood" ="E045","E044 Primary T regulatory cells from peripheral blood" ="E044","E043 Primary T helper cells from peripheral blood" ="E043","E039 Primary T helper naive cells from peripheral blood" ="E039","E041 Primary T helper cells PMA-I stimulated" ="E041","E042 Primary T helper 17 cells PMA-I stimulated" ="E042","E040 Primary T helper memory cells from peripheral blood 1" ="E040","E037 Primary T helper memory cells from peripheral blood 2" ="E037","E048 Primary T CD8+ memory cells from peripheral blood" ="E048","E038 Primary T helper naive cells from peripheral blood" ="E038","E047 Primary T CD8+ naive cells from peripheral blood" ="E047","E029 Primary monocytes from peripheral blood" ="E029","E050 Primary hematopoietic stem cells G-CSF-mobilized Female" ="E050","E032 Primary B cells from peripheral blood" ="E032","E046 Primary Natural Killer cells from peripheral blood" ="E046","E124 Monocytes-CD14+ RO01746 Primary Cells" ="E124"), selected= c("E062","E034","E045","E044","E043","E039","E041","E042","E040","E037","E048","E038","E047","E029","E050","E032","E046","E124"))
updateCheckboxGroupInput(session=session, inputId="Brain_Adult_18", choices=list("E071 Brain Hippocampus Middle" ="E071","E074 Brain Substantia Nigra" ="E074","E068 Brain Anterior Caudate" ="E068","E069 Brain Cingulate Gyrus" ="E069","E072 Brain Inferior Temporal Lobe" ="E072","E067 Brain Angular Gyrus" ="E067","E073 Brain_Dorsolateral_Prefrontal_Cortex" ="E073"), selected= c("E071","E074","E068","E069","E072","E067","E073"))
updateCheckboxGroupInput(session=session, inputId="Fat_Adult_18", choices=list("E063 Adipose Nuclei" ="E063"), selected= c("E063"))
updateCheckboxGroupInput(session=session, inputId="GI_Colon_Adult_18", choices=list("E076 Colon Smooth Muscle" ="E076","E106 Sigmoid Colon" ="E106","E075 Colonic Mucosa" ="E075"), selected= c("E076","E106","E075"))
updateCheckboxGroupInput(session=session, inputId="GI_Duodenum_Adult_18", choices=list("E078 Duodenum Smooth Muscle" ="E078"), selected= c("E078"))
updateCheckboxGroupInput(session=session, inputId="GI_Esophagus_Adult_18", choices=list("E079 Esophagus" ="E079"), selected= c("E079"))
updateCheckboxGroupInput(session=session, inputId="GI_Intestine_Adult_18", choices=list("E109 Small Intestine" ="E109"), selected= c("E109"))
updateCheckboxGroupInput(session=session, inputId="GI_Rectum_Adult_18", choices=list("E103 Rectal Smooth Muscle" ="E103","E101 Rectal Mucosa Donor 29" ="E101","E102 Rectal Mucosa Donor 31" ="E102"), selected= c("E103","E101","E102"))
updateCheckboxGroupInput(session=session, inputId="GI_Stomach_Adult_18", choices=list("E111 Stomach Smooth Muscle" ="E111","E094 Gastric" ="E094"), selected= c("E111","E094"))
updateCheckboxGroupInput(session=session, inputId="Heart_Adult_18", choices=list("E104 Right Atrium" ="E104","E095 Left Ventricle" ="E095","E105 Right Ventricle" ="E105"), selected= c("E104","E095","E105"))
updateCheckboxGroupInput(session=session, inputId="Liver_Adult_18", choices=list("E066 Liver" ="E066"), selected= c("E066"))
updateCheckboxGroupInput(session=session, inputId="Lung_Adult_18", choices=list("E096 Lung" ="E096"), selected= c("E096"))
updateCheckboxGroupInput(session=session, inputId="Muscle_Adult_18", choices=list("E100 Psoas Muscle" ="E100","E108 Skeletal Muscle Female" ="E108"), selected= c("E100","E108"))
updateCheckboxGroupInput(session=session, inputId="Ovary_Adult_18", choices=list("E097 Ovary" ="E097"), selected= c("E097"))
updateCheckboxGroupInput(session=session, inputId="Pancreas_Adult_18", choices=list("E087 Pancreatic Islets" ="E087","E098 Pancreas" ="E098"), selected= c("E087","E098"))
updateCheckboxGroupInput(session=session, inputId="Spleen_Adult_18", choices=list("E113 Spleen" ="E113"), selected= c("E113"))
updateCheckboxGroupInput(session=session, inputId="Thymus_Adult_18", choices=list("E112 Thymus" ="E112"), selected= c("E112"))
updateCheckboxGroupInput(session=session, inputId="Vascular_Adult_18", choices=list("E065 Aorta" ="E065"), selected= c("E065"))
updateCheckboxGroupInput(session=session, inputId="Adrenal_Fetal_18", choices=list("E080 Fetal Adrenal Gland" ="E080"), selected= c("E080"))
updateCheckboxGroupInput(session=session, inputId="Brain_Fetal_18", choices=list("E070 Brain Germinal Matrix" ="E070","E082 Fetal Brain Female" ="E082","E081 Fetal Brain Male" ="E081"), selected= c("E070","E082","E081"))
updateCheckboxGroupInput(session=session, inputId="GI_Intestine_Fetal_18", choices=list("E085 Fetal Intestine Small" ="E085","E084 Fetal Intestine Large" ="E084"), selected= c("E085","E084"))
updateCheckboxGroupInput(session=session, inputId="GI_Stomach_Fetal_18", choices=list("E092 Fetal Stomach" ="E092"), selected= c("E092"))
updateCheckboxGroupInput(session=session, inputId="Muscle_Fetal_18", choices=list("E089 Fetal Muscle Trunk" ="E089","E090 Fetal Muscle Leg" ="E090"), selected= c("E089","E090"))
updateCheckboxGroupInput(session=session, inputId="Placenta_Fetal_18", choices=list("E099 Placenta Amnion" ="E099","E091 Placenta" ="E091"), selected= c("E099","E091"))
updateCheckboxGroupInput(session=session, inputId="Thymus_Fetal_18", choices=list("E093 Fetal Thymus" ="E093"), selected= c("E093"))
updateCheckboxGroupInput(session=session, inputId="Blood_CellLine_18", choices=list("E115 Dnd41 TCell Leukemia Cell Line" ="E115"), selected= c("E115"))
updateCheckboxGroupInput(session=session, inputId="Cervix_CellLine_18", choices=list("E117 HeLa-S3 Cervical Carcinoma Cell Line" ="E117"), selected= c("E117"))
updateCheckboxGroupInput(session=session, inputId="Liver_CellLine_18", choices=list("E118 HepG2 Hepatocellular Carcinoma Cell Line" ="E118"), selected= c("E118"))
updateCheckboxGroupInput(session=session, inputId="Lung_CellLine_18", choices=list("E017 IMR90 fetal lung fibroblasts Cell Line" ="E017","E114 A549 EtOH 0.02pct Lung Carcinoma Cell Line" ="E114"), selected= c("E017","E114"))                                                                          
          }
          else {
updateCheckboxGroupInput(session=session, inputId="Blood_Culture_18", choices=list("E116 GM12878 Lymphoblastoid Cells" ="E116","E123 K562 Leukemia Cells" ="E123"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Bone_Culture_18", choices=list("E129 Osteoblast Primary Cells" ="E129"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Brain_Culture_18", choices=list("E125 NH-A Astrocytes Primary Cells" ="E125"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Breast_Culture_18", choices=list("E119 HMEC Mammary Epithelial Primary Cells" ="E119"), selected= c())
updateCheckboxGroupInput(session=session, inputId="ESC_Culture_18", choices=list("E008 H9 Cells" ="E008","E015 HUES6 Cells" ="E015","E014 HUES48 Cells" ="E014","E016 HUES64 Cells" ="E016","E003 H1 Cells" ="E003"), selected= c())
updateCheckboxGroupInput(session=session, inputId="ESC_Derived_Culture_18", choices=list("E007 H1 Derived Neuronal Progenitor Cultured Cells" ="E007","E013 hESC Derived CD56+ Mesoderm Cultured Cells" ="E013","E012 hESC Derived CD56+ Ectoderm Cultured Cells" ="E012","E011 hESC Derived CD184+ Endoderm Cultured Cells" ="E011","E004 H1 BMP4 Derived Mesendoderm Cultured Cells" ="E004","E005 H1 BMP4 Derived Trophoblast Cultured Cells" ="E005","E006 H1 Derived Mesenchymal Stem Cells" ="E006"), selected= c())
updateCheckboxGroupInput(session=session, inputId="IPSC_Culture_18", choices=list("E020 iPS-20b Cells" ="E020","E019 iPS-18 Cells" ="E019","E021 iPS DF 6.9 Cells" ="E021","E022 iPS DF 19.11 Cells" ="E022"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Lung_Culture_18", choices=list("E128 NHLF Lung Fibroblast Primary Cells" ="E128"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Muscle_Culture_18", choices=list("E120 HSMM Skeletal Muscle Myoblasts Cells" ="E120","E121 HSMM cell derived Skeletal Muscle Myotubes Cells" ="E121"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Skin_Culture_18", choices=list("E055 Foreskin Fibroblast Primary Cells skin01" ="E055","E056 Foreskin Fibroblast Primary Cells skin02" ="E056","E059 Foreskin Melanocyte Primary Cells skin01" ="E059","E061 Foreskin Melanocyte Primary Cells skin03" ="E061","E058 Foreskin Keratinocyte Primary Cells skin03" ="E058","E126 NHDF-Ad Adult Dermal Fibroblast Primary Cells" ="E126","E127 NHEK-Epidermal Keratinocyte Primary Cells" ="E127"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Stromal_Connective_Culture_18", choices=list("E026 Bone Marrow Derived Cultured Mesenchymal Stem Cells" ="E026","E049 Mesenchymal Stem Cell Derived Chondrocyte Cultured Cells" ="E049"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Vascular_Culture_18", choices=list("E122 HUVEC Umbilical Vein Endothelial Primary Cells" ="E122"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Blood_Adult_18", choices=list("E062 Primary mononuclear cells from peripheral blood" ="E062","E034 Primary T cells from peripheral blood" ="E034","E045 Primary T cells effector/memory enriched from peripheral blood" ="E045","E044 Primary T regulatory cells from peripheral blood" ="E044","E043 Primary T helper cells from peripheral blood" ="E043","E039 Primary T helper naive cells from peripheral blood" ="E039","E041 Primary T helper cells PMA-I stimulated" ="E041","E042 Primary T helper 17 cells PMA-I stimulated" ="E042","E040 Primary T helper memory cells from peripheral blood 1" ="E040","E037 Primary T helper memory cells from peripheral blood 2" ="E037","E048 Primary T CD8+ memory cells from peripheral blood" ="E048","E038 Primary T helper naive cells from peripheral blood" ="E038","E047 Primary T CD8+ naive cells from peripheral blood" ="E047","E029 Primary monocytes from peripheral blood" ="E029","E050 Primary hematopoietic stem cells G-CSF-mobilized Female" ="E050","E032 Primary B cells from peripheral blood" ="E032","E046 Primary Natural Killer cells from peripheral blood" ="E046","E124 Monocytes-CD14+ RO01746 Primary Cells" ="E124"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Brain_Adult_18", choices=list("E071 Brain Hippocampus Middle" ="E071","E074 Brain Substantia Nigra" ="E074","E068 Brain Anterior Caudate" ="E068","E069 Brain Cingulate Gyrus" ="E069","E072 Brain Inferior Temporal Lobe" ="E072","E067 Brain Angular Gyrus" ="E067","E073 Brain_Dorsolateral_Prefrontal_Cortex" ="E073"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Fat_Adult_18", choices=list("E063 Adipose Nuclei" ="E063"), selected= c())
updateCheckboxGroupInput(session=session, inputId="GI_Colon_Adult_18", choices=list("E076 Colon Smooth Muscle" ="E076","E106 Sigmoid Colon" ="E106","E075 Colonic Mucosa" ="E075"), selected= c())
updateCheckboxGroupInput(session=session, inputId="GI_Duodenum_Adult_18", choices=list("E078 Duodenum Smooth Muscle" ="E078"), selected= c())
updateCheckboxGroupInput(session=session, inputId="GI_Esophagus_Adult_18", choices=list("E079 Esophagus" ="E079"), selected= c())
updateCheckboxGroupInput(session=session, inputId="GI_Intestine_Adult_18", choices=list("E109 Small Intestine" ="E109"), selected= c())
updateCheckboxGroupInput(session=session, inputId="GI_Rectum_Adult_18", choices=list("E103 Rectal Smooth Muscle" ="E103","E101 Rectal Mucosa Donor 29" ="E101","E102 Rectal Mucosa Donor 31" ="E102"), selected= c())
updateCheckboxGroupInput(session=session, inputId="GI_Stomach_Adult_18", choices=list("E111 Stomach Smooth Muscle" ="E111","E094 Gastric" ="E094"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Heart_Adult_18", choices=list("E104 Right Atrium" ="E104","E095 Left Ventricle" ="E095","E105 Right Ventricle" ="E105"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Liver_Adult_18", choices=list("E066 Liver" ="E066"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Lung_Adult_18", choices=list("E096 Lung" ="E096"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Muscle_Adult_18", choices=list("E100 Psoas Muscle" ="E100","E108 Skeletal Muscle Female" ="E108"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Ovary_Adult_18", choices=list("E097 Ovary" ="E097"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Pancreas_Adult_18", choices=list("E087 Pancreatic Islets" ="E087","E098 Pancreas" ="E098"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Spleen_Adult_18", choices=list("E113 Spleen" ="E113"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Thymus_Adult_18", choices=list("E112 Thymus" ="E112"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Vascular_Adult_18", choices=list("E065 Aorta" ="E065"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Adrenal_Fetal_18", choices=list("E080 Fetal Adrenal Gland" ="E080"), selected= c())
updateCheckboxGroupInput(session=session, inputId="GI_Intestine_Fetal_18", choices=list("E085 Fetal Intestine Small" ="E085","E084 Fetal Intestine Large" ="E084"), selected= c())
updateCheckboxGroupInput(session=session, inputId="GI_Stomach_Fetal_18", choices=list("E092 Fetal Stomach" ="E092"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Muscle_Fetal_18", choices=list("E089 Fetal Muscle Trunk" ="E089","E090 Fetal Muscle Leg" ="E090"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Placenta_Fetal_18", choices=list("E099 Placenta Amnion" ="E099","E091 Placenta" ="E091"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Thymus_Fetal_18", choices=list("E093 Fetal Thymus" ="E093"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Blood_CellLine_18", choices=list("E115 Dnd41 TCell Leukemia Cell Line" ="E115"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Cervix_CellLine_18", choices=list("E117 HeLa-S3 Cervical Carcinoma Cell Line" ="E117"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Liver_CellLine_18", choices=list("E118 HepG2 Hepatocellular Carcinoma Cell Line" ="E118"), selected= c())
updateCheckboxGroupInput(session=session, inputId="Lung_CellLine_18", choices=list("E017 IMR90 fetal lung fibroblasts Cell Line" ="E017","E114 A549 EtOH 0.02pct Lung Carcinoma Cell Line" ="E114"), selected= c())                                         
            }}
        })


#select all for each tissue
observe({ 
if (input$select_Blood_Culture_18 > 0) { 
  if (input$select_Blood_Culture_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Blood_Culture_18", choices=list("E116 GM12878 Lymphoblastoid Cells" ="E116","E123 K562 Leukemia Cells" ="E123"), selected= c("E116","E123"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Blood_Culture_18", choices=list("E116 GM12878 Lymphoblastoid Cells" ="E116","E123 K562 Leukemia Cells" ="E123"), selected= c()) }} })
observe({ 
if (input$select_Bone_Culture_18 > 0) { 
  if (input$select_Bone_Culture_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Bone_Culture_18", choices=list("E129 Osteoblast Primary Cells" ="E129"), selected= c("E129"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Bone_Culture_18", choices=list("E129 Osteoblast Primary Cells" ="E129"), selected= c()) }} })
observe({ 
if (input$select_Brain_Culture_18 > 0) { 
  if (input$select_Brain_Culture_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Brain_Culture_18", choices=list("E125 NH-A Astrocytes Primary Cells" ="E125"), selected= c("E125"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Brain_Culture_18", choices=list("E125 NH-A Astrocytes Primary Cells" ="E125"), selected= c()) }} })
observe({ 
if (input$select_Breast_Culture_18 > 0) { 
  if (input$select_Breast_Culture_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Breast_Culture_18", choices=list("E119 HMEC Mammary Epithelial Primary Cells" ="E119"), selected= c("E119"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Breast_Culture_18", choices=list("E119 HMEC Mammary Epithelial Primary Cells" ="E119"), selected= c()) }} })
observe({ 
if (input$select_ESC_Culture_18 > 0) { 
  if (input$select_ESC_Culture_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="ESC_Culture_18", choices=list("E008 H9 Cells" ="E008","E015 HUES6 Cells" ="E015","E014 HUES48 Cells" ="E014","E016 HUES64 Cells" ="E016","E003 H1 Cells" ="E003"), selected= c("E008","E015","E014","E016","E003"))} 
  else { updateCheckboxGroupInput(session=session, inputId="ESC_Culture_18", choices=list("E008 H9 Cells" ="E008","E015 HUES6 Cells" ="E015","E014 HUES48 Cells" ="E014","E016 HUES64 Cells" ="E016","E003 H1 Cells" ="E003"), selected= c()) }} })
observe({ 
if (input$select_ESC_Derived_Culture_18 > 0) { 
  if (input$select_ESC_Derived_Culture_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="ESC_Derived_Culture_18", choices=list("E007 H1 Derived Neuronal Progenitor Cultured Cells" ="E007","E013 hESC Derived CD56+ Mesoderm Cultured Cells" ="E013","E012 hESC Derived CD56+ Ectoderm Cultured Cells" ="E012","E011 hESC Derived CD184+ Endoderm Cultured Cells" ="E011","E004 H1 BMP4 Derived Mesendoderm Cultured Cells" ="E004","E005 H1 BMP4 Derived Trophoblast Cultured Cells" ="E005","E006 H1 Derived Mesenchymal Stem Cells" ="E006"), selected= c("E007","E013","E012","E011","E004","E005","E006"))} 
  else { updateCheckboxGroupInput(session=session, inputId="ESC_Derived_Culture_18", choices=list("E007 H1 Derived Neuronal Progenitor Cultured Cells" ="E007","E013 hESC Derived CD56+ Mesoderm Cultured Cells" ="E013","E012 hESC Derived CD56+ Ectoderm Cultured Cells" ="E012","E011 hESC Derived CD184+ Endoderm Cultured Cells" ="E011","E004 H1 BMP4 Derived Mesendoderm Cultured Cells" ="E004","E005 H1 BMP4 Derived Trophoblast Cultured Cells" ="E005","E006 H1 Derived Mesenchymal Stem Cells" ="E006"), selected= c()) }} })
observe({ 
if (input$select_IPSC_Culture_18 > 0) { 
  if (input$select_IPSC_Culture_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="IPSC_Culture_18", choices=list("E020 iPS-20b Cells" ="E020","E019 iPS-18 Cells" ="E019","E021 iPS DF 6.9 Cells" ="E021","E022 iPS DF 19.11 Cells" ="E022"), selected= c("E020","E019","E021","E022"))} 
  else { updateCheckboxGroupInput(session=session, inputId="IPSC_Culture_18", choices=list("E020 iPS-20b Cells" ="E020","E019 iPS-18 Cells" ="E019","E021 iPS DF 6.9 Cells" ="E021","E022 iPS DF 19.11 Cells" ="E022"), selected= c()) }} })
observe({ 
if (input$select_Lung_Culture_18 > 0) { 
  if (input$select_Lung_Culture_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Lung_Culture_18", choices=list("E128 NHLF Lung Fibroblast Primary Cells" ="E128"), selected= c("E128"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Lung_Culture_18", choices=list("E128 NHLF Lung Fibroblast Primary Cells" ="E128"), selected= c()) }} })
observe({ 
if (input$select_Muscle_Culture_18 > 0) { 
  if (input$select_Muscle_Culture_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Muscle_Culture_18", choices=list("E120 HSMM Skeletal Muscle Myoblasts Cells" ="E120","E121 HSMM cell derived Skeletal Muscle Myotubes Cells" ="E121"), selected= c("E120","E121"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Muscle_Culture_18", choices=list("E120 HSMM Skeletal Muscle Myoblasts Cells" ="E120","E121 HSMM cell derived Skeletal Muscle Myotubes Cells" ="E121"), selected= c()) }} })
observe({ 
if (input$select_Skin_Culture_18 > 0) { 
  if (input$select_Skin_Culture_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Skin_Culture_18", choices=list("E055 Foreskin Fibroblast Primary Cells skin01" ="E055","E056 Foreskin Fibroblast Primary Cells skin02" ="E056","E059 Foreskin Melanocyte Primary Cells skin01" ="E059","E061 Foreskin Melanocyte Primary Cells skin03" ="E061","E058 Foreskin Keratinocyte Primary Cells skin03" ="E058","E126 NHDF-Ad Adult Dermal Fibroblast Primary Cells" ="E126","E127 NHEK-Epidermal Keratinocyte Primary Cells" ="E127"), selected= c("E055","E056","E059","E061","E058","E126","E127"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Skin_Culture_18", choices=list("E055 Foreskin Fibroblast Primary Cells skin01" ="E055","E056 Foreskin Fibroblast Primary Cells skin02" ="E056","E059 Foreskin Melanocyte Primary Cells skin01" ="E059","E061 Foreskin Melanocyte Primary Cells skin03" ="E061","E058 Foreskin Keratinocyte Primary Cells skin03" ="E058","E126 NHDF-Ad Adult Dermal Fibroblast Primary Cells" ="E126","E127 NHEK-Epidermal Keratinocyte Primary Cells" ="E127"), selected= c()) }} })
observe({ 
if (input$select_Stromal_Connective_Culture_18 > 0) { 
  if (input$select_Stromal_Connective_Culture_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Stromal_Connective_Culture_18", choices=list("E026 Bone Marrow Derived Cultured Mesenchymal Stem Cells" ="E026","E049 Mesenchymal Stem Cell Derived Chondrocyte Cultured Cells" ="E049"), selected= c("E026","E049"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Stromal_Connective_Culture_18", choices=list("E026 Bone Marrow Derived Cultured Mesenchymal Stem Cells" ="E026","E049 Mesenchymal Stem Cell Derived Chondrocyte Cultured Cells" ="E049"), selected= c()) }} })
observe({ 
if (input$select_Vascular_Culture_18 > 0) { 
  if (input$select_Vascular_Culture_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Vascular_Culture_18", choices=list("E122 HUVEC Umbilical Vein Endothelial Primary Cells" ="E122"), selected= c("E122"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Vascular_Culture_18", choices=list("E122 HUVEC Umbilical Vein Endothelial Primary Cells" ="E122"), selected= c()) }} })
observe({ 
if (input$select_Blood_Adult_18 > 0) { 
  if (input$select_Blood_Adult_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Blood_Adult_18", choices=list("E062 Primary mononuclear cells from peripheral blood" ="E062","E034 Primary T cells from peripheral blood" ="E034","E045 Primary T cells effector/memory enriched from peripheral blood" ="E045","E044 Primary T regulatory cells from peripheral blood" ="E044","E043 Primary T helper cells from peripheral blood" ="E043","E039 Primary T helper naive cells from peripheral blood" ="E039","E041 Primary T helper cells PMA-I stimulated" ="E041","E042 Primary T helper 17 cells PMA-I stimulated" ="E042","E040 Primary T helper memory cells from peripheral blood 1" ="E040","E037 Primary T helper memory cells from peripheral blood 2" ="E037","E048 Primary T CD8+ memory cells from peripheral blood" ="E048","E038 Primary T helper naive cells from peripheral blood" ="E038","E047 Primary T CD8+ naive cells from peripheral blood" ="E047","E029 Primary monocytes from peripheral blood" ="E029","E050 Primary hematopoietic stem cells G-CSF-mobilized Female" ="E050","E032 Primary B cells from peripheral blood" ="E032","E046 Primary Natural Killer cells from peripheral blood" ="E046","E124 Monocytes-CD14+ RO01746 Primary Cells" ="E124"), selected= c("E062","E034","E045","E044","E043","E039","E041","E042","E040","E037","E048","E038","E047","E029","E050","E032","E046","E124"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Blood_Adult_18", choices=list("E062 Primary mononuclear cells from peripheral blood" ="E062","E034 Primary T cells from peripheral blood" ="E034","E045 Primary T cells effector/memory enriched from peripheral blood" ="E045","E044 Primary T regulatory cells from peripheral blood" ="E044","E043 Primary T helper cells from peripheral blood" ="E043","E039 Primary T helper naive cells from peripheral blood" ="E039","E041 Primary T helper cells PMA-I stimulated" ="E041","E042 Primary T helper 17 cells PMA-I stimulated" ="E042","E040 Primary T helper memory cells from peripheral blood 1" ="E040","E037 Primary T helper memory cells from peripheral blood 2" ="E037","E048 Primary T CD8+ memory cells from peripheral blood" ="E048","E038 Primary T helper naive cells from peripheral blood" ="E038","E047 Primary T CD8+ naive cells from peripheral blood" ="E047","E029 Primary monocytes from peripheral blood" ="E029","E050 Primary hematopoietic stem cells G-CSF-mobilized Female" ="E050","E032 Primary B cells from peripheral blood" ="E032","E046 Primary Natural Killer cells from peripheral blood" ="E046","E124 Monocytes-CD14+ RO01746 Primary Cells" ="E124"), selected= c()) }} })
observe({ 
if (input$select_Brain_Adult_18 > 0) { 
  if (input$select_Brain_Adult_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Brain_Adult_18", choices=list("E071 Brain Hippocampus Middle" ="E071","E074 Brain Substantia Nigra" ="E074","E068 Brain Anterior Caudate" ="E068","E069 Brain Cingulate Gyrus" ="E069","E072 Brain Inferior Temporal Lobe" ="E072","E067 Brain Angular Gyrus" ="E067","E073 Brain_Dorsolateral_Prefrontal_Cortex" ="E073"), selected= c("E071","E074","E068","E069","E072","E067","E073"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Brain_Adult_18", choices=list("E071 Brain Hippocampus Middle" ="E071","E074 Brain Substantia Nigra" ="E074","E068 Brain Anterior Caudate" ="E068","E069 Brain Cingulate Gyrus" ="E069","E072 Brain Inferior Temporal Lobe" ="E072","E067 Brain Angular Gyrus" ="E067","E073 Brain_Dorsolateral_Prefrontal_Cortex" ="E073"), selected= c()) }} })
observe({ 
if (input$select_Fat_Adult_18 > 0) { 
  if (input$select_Fat_Adult_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Fat_Adult_18", choices=list("E063 Adipose Nuclei" ="E063"), selected= c("E063"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Fat_Adult_18", choices=list("E063 Adipose Nuclei" ="E063"), selected= c()) }} })
observe({ 
if (input$select_GI_Colon_Adult_18 > 0) { 
  if (input$select_GI_Colon_Adult_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="GI_Colon_Adult_18", choices=list("E076 Colon Smooth Muscle" ="E076","E106 Sigmoid Colon" ="E106","E075 Colonic Mucosa" ="E075"), selected= c("E076","E106","E075"))} 
  else { updateCheckboxGroupInput(session=session, inputId="GI_Colon_Adult_18", choices=list("E076 Colon Smooth Muscle" ="E076","E106 Sigmoid Colon" ="E106","E075 Colonic Mucosa" ="E075"), selected= c()) }} })
observe({ 
if (input$select_GI_Duodenum_Adult_18 > 0) { 
  if (input$select_GI_Duodenum_Adult_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="GI_Duodenum_Adult_18", choices=list("E078 Duodenum Smooth Muscle" ="E078"), selected= c("E078"))} 
  else { updateCheckboxGroupInput(session=session, inputId="GI_Duodenum_Adult_18", choices=list("E078 Duodenum Smooth Muscle" ="E078"), selected= c()) }} })
observe({ 
if (input$select_GI_Esophagus_Adult_18 > 0) { 
  if (input$select_GI_Esophagus_Adult_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="GI_Esophagus_Adult_18", choices=list("E079 Esophagus" ="E079"), selected= c("E079"))} 
  else { updateCheckboxGroupInput(session=session, inputId="GI_Esophagus_Adult_18", choices=list("E079 Esophagus" ="E079"), selected= c()) }} })
observe({ 
if (input$select_GI_Intestine_Adult_18 > 0) { 
  if (input$select_GI_Intestine_Adult_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="GI_Intestine_Adult_18", choices=list("E109 Small Intestine" ="E109"), selected= c("E109"))} 
  else { updateCheckboxGroupInput(session=session, inputId="GI_Intestine_Adult_18", choices=list("E109 Small Intestine" ="E109"), selected= c()) }} })
observe({ 
if (input$select_GI_Rectum_Adult_18 > 0) { 
  if (input$select_GI_Rectum_Adult_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="GI_Rectum_Adult_18", choices=list("E103 Rectal Smooth Muscle" ="E103","E101 Rectal Mucosa Donor 29" ="E101","E102 Rectal Mucosa Donor 31" ="E102"), selected= c("E103","E101","E102"))} 
  else { updateCheckboxGroupInput(session=session, inputId="GI_Rectum_Adult_18", choices=list("E103 Rectal Smooth Muscle" ="E103","E101 Rectal Mucosa Donor 29" ="E101","E102 Rectal Mucosa Donor 31" ="E102"), selected= c()) }} })
observe({ 
if (input$select_GI_Stomach_Adult_18 > 0) { 
  if (input$select_GI_Stomach_Adult_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="GI_Stomach_Adult_18", choices=list("E111 Stomach Smooth Muscle" ="E111","E094 Gastric" ="E094"), selected= c("E111","E094"))} 
  else { updateCheckboxGroupInput(session=session, inputId="GI_Stomach_Adult_18", choices=list("E111 Stomach Smooth Muscle" ="E111","E094 Gastric" ="E094"), selected= c()) }} })
observe({ 
if (input$select_Heart_Adult_18 > 0) { 
  if (input$select_Heart_Adult_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Heart_Adult_18", choices=list("E104 Right Atrium" ="E104","E095 Left Ventricle" ="E095","E105 Right Ventricle" ="E105"), selected= c("E104","E095","E105"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Heart_Adult_18", choices=list("E104 Right Atrium" ="E104","E095 Left Ventricle" ="E095","E105 Right Ventricle" ="E105"), selected= c()) }} })
observe({ 
if (input$select_Liver_Adult_18 > 0) { 
  if (input$select_Liver_Adult_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Liver_Adult_18", choices=list("E066 Liver" ="E066"), selected= c("E066"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Liver_Adult_18", choices=list("E066 Liver" ="E066"), selected= c()) }} })
observe({ 
if (input$select_Lung_Adult_18 > 0) { 
  if (input$select_Lung_Adult_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Lung_Adult_18", choices=list("E096 Lung" ="E096"), selected= c("E096"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Lung_Adult_18", choices=list("E096 Lung" ="E096"), selected= c()) }} })
observe({ 
if (input$select_Muscle_Adult_18 > 0) { 
  if (input$select_Muscle_Adult_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Muscle_Adult_18", choices=list("E100 Psoas Muscle" ="E100","E108 Skeletal Muscle Female" ="E108"), selected= c("E100","E108"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Muscle_Adult_18", choices=list("E100 Psoas Muscle" ="E100","E108 Skeletal Muscle Female" ="E108"), selected= c()) }} })
observe({ 
if (input$select_Ovary_Adult_18 > 0) { 
  if (input$select_Ovary_Adult_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Ovary_Adult_18", choices=list("E097 Ovary" ="E097"), selected= c("E097"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Ovary_Adult_18", choices=list("E097 Ovary" ="E097"), selected= c()) }} })
observe({ 
if (input$select_Pancreas_Adult_18 > 0) { 
  if (input$select_Pancreas_Adult_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Pancreas_Adult_18", choices=list("E087 Pancreatic Islets" ="E087","E098 Pancreas" ="E098"), selected= c("E087","E098"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Pancreas_Adult_18", choices=list("E087 Pancreatic Islets" ="E087","E098 Pancreas" ="E098"), selected= c()) }} })
observe({ 
if (input$select_Spleen_Adult_18 > 0) { 
  if (input$select_Spleen_Adult_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Spleen_Adult_18", choices=list("E113 Spleen" ="E113"), selected= c("E113"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Spleen_Adult_18", choices=list("E113 Spleen" ="E113"), selected= c()) }} })
observe({ 
if (input$select_Thymus_Adult_18 > 0) { 
  if (input$select_Thymus_Adult_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Thymus_Adult_18", choices=list("E112 Thymus" ="E112"), selected= c("E112"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Thymus_Adult_18", choices=list("E112 Thymus" ="E112"), selected= c()) }} })
observe({ 
if (input$select_Vascular_Adult_18 > 0) { 
  if (input$select_Vascular_Adult_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Vascular_Adult_18", choices=list("E065 Aorta" ="E065"), selected= c("E065"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Vascular_Adult_18", choices=list("E065 Aorta" ="E065"), selected= c()) }} })
observe({ 
if (input$select_Adrenal_Fetal_18 > 0) { 
  if (input$select_Adrenal_Fetal_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Adrenal_Fetal_18", choices=list("E080 Fetal Adrenal Gland" ="E080"), selected= c("E080"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Adrenal_Fetal_18", choices=list("E080 Fetal Adrenal Gland" ="E080"), selected= c()) }} })
observe({ 
if (input$select_GI_Intestine_Fetal_18 > 0) { 
  if (input$select_GI_Intestine_Fetal_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="GI_Intestine_Fetal_18", choices=list("E085 Fetal Intestine Small" ="E085","E084 Fetal Intestine Large" ="E084"), selected= c("E085","E084"))} 
  else { updateCheckboxGroupInput(session=session, inputId="GI_Intestine_Fetal_18", choices=list("E085 Fetal Intestine Small" ="E085","E084 Fetal Intestine Large" ="E084"), selected= c()) }} })
observe({ 
if (input$select_GI_Stomach_Fetal_18 > 0) { 
  if (input$select_GI_Stomach_Fetal_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="GI_Stomach_Fetal_18", choices=list("E092 Fetal Stomach" ="E092"), selected= c("E092"))} 
  else { updateCheckboxGroupInput(session=session, inputId="GI_Stomach_Fetal_18", choices=list("E092 Fetal Stomach" ="E092"), selected= c()) }} })
observe({ 
if (input$select_Muscle_Fetal_18 > 0) { 
  if (input$select_Muscle_Fetal_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Muscle_Fetal_18", choices=list("E089 Fetal Muscle Trunk" ="E089","E090 Fetal Muscle Leg" ="E090"), selected= c("E089","E090"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Muscle_Fetal_18", choices=list("E089 Fetal Muscle Trunk" ="E089","E090 Fetal Muscle Leg" ="E090"), selected= c()) }} })
observe({ 
if (input$select_Placenta_Fetal_18 > 0) { 
  if (input$select_Placenta_Fetal_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Placenta_Fetal_18", choices=list("E099 Placenta Amnion" ="E099","E091 Placenta" ="E091"), selected= c("E099","E091"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Placenta_Fetal_18", choices=list("E099 Placenta Amnion" ="E099","E091 Placenta" ="E091"), selected= c()) }} })
observe({ 
if (input$select_Thymus_Fetal_18 > 0) { 
  if (input$select_Thymus_Fetal_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Thymus_Fetal_18", choices=list("E093 Fetal Thymus" ="E093"), selected= c("E093"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Thymus_Fetal_18", choices=list("E093 Fetal Thymus" ="E093"), selected= c()) }} })
observe({ 
if (input$select_Blood_CellLine_18 > 0) { 
  if (input$select_Blood_CellLine_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Blood_CellLine_18", choices=list("E115 Dnd41 TCell Leukemia Cell Line" ="E115"), selected= c("E115"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Blood_CellLine_18", choices=list("E115 Dnd41 TCell Leukemia Cell Line" ="E115"), selected= c()) }} })
observe({ 
if (input$select_Cervix_CellLine_18 > 0) { 
  if (input$select_Cervix_CellLine_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Cervix_CellLine_18", choices=list("E117 HeLa-S3 Cervical Carcinoma Cell Line" ="E117"), selected= c("E117"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Cervix_CellLine_18", choices=list("E117 HeLa-S3 Cervical Carcinoma Cell Line" ="E117"), selected= c()) }} })
observe({ 
if (input$select_Liver_CellLine_18 > 0) { 
  if (input$select_Liver_CellLine_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Liver_CellLine_18", choices=list("E118 HepG2 Hepatocellular Carcinoma Cell Line" ="E118"), selected= c("E118"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Liver_CellLine_18", choices=list("E118 HepG2 Hepatocellular Carcinoma Cell Line" ="E118"), selected= c()) }} })
observe({ 
if (input$select_Lung_CellLine_18 > 0) { 
  if (input$select_Lung_CellLine_18 %% 2 == 1){ updateCheckboxGroupInput(session=session, inputId="Lung_CellLine_18", choices=list("E017 IMR90 fetal lung fibroblasts Cell Line" ="E017","E114 A549 EtOH 0.02pct Lung Carcinoma Cell Line" ="E114"), selected= c("E017","E114"))} 
  else { updateCheckboxGroupInput(session=session, inputId="Lung_CellLine_18", choices=list("E017 IMR90 fetal lung fibroblasts Cell Line" ="E017","E114 A549 EtOH 0.02pct Lung Carcinoma Cell Line" ="E114"), selected= c()) }} })


############################################



  fore <- reactiveValues(data = NULL)
  back <- reactiveValues(data = NULL)

  observeEvent(input$selectFore,{
      if (input$selectHMM == '15 model'){
      fore$data <- c(input$Blood_Culture,input$Bone_Culture,input$Brain_Culture,input$Breast_Culture,input$ESC_Culture,input$ESC_Derived_Culture,input$Fat_Culture,input$IPSC_Culture,input$Lung_Culture,input$Muscle_Culture,input$Skin_Culture,input$Stromal_Connective_Culture,input$Vascular_Culture,input$Blood_Adult,input$Brain_Adult,input$Breast_Adult,input$Fat_Adult,input$GI_Colon_Adult,input$GI_Duodenum_Adult,input$GI_Esophagus_Adult,input$GI_Intestine_Adult,input$GI_Rectum_Adult,input$GI_Stomach_Adult,input$Heart_Adult,input$Liver_Adult,input$Lung_Adult,input$Muscle_Adult,input$Ovary_Adult,input$Pancreas_Adult,input$Spleen_Adult,input$Thymus_Adult,input$Vascular_Adult,input$Adrenal_Fetal,input$Blood_Fetal,input$Brain_Fetal,input$GI_Intestine_Fetal,input$GI_Stomach_Fetal,input$Heart_Fetal,input$Kidney_Fetal,input$Lung_Fetal,input$Muscle_Fetal,input$Placenta_Fetal,input$Thymus_Fetal,input$Blood_CellLine,input$Cervix_CellLine,input$Liver_CellLine,input$Lung_CellLine)
      }else{
      fore$data <- c(input$Blood_Culture_18,input$Bone_Culture_18,input$Brain_Culture_18,input$Breast_Culture_18,input$ESC_Culture_18,input$ESC_Derived_Culture_18,input$Fat_Culture_18,input$IPSC_Culture_18,input$Lung_Culture_18,input$Muscle_Culture_18,input$Skin_Culture_18,input$Stromal_Connective_Culture_18,input$Vascular_Culture_18,input$Blood_Adult_18,input$Brain_Adult_18,input$Breast_Adult_18,input$Fat_Adult_18,input$GI_Colon_Adult_18,input$GI_Duodenum_Adult_18,input$GI_Esophagus_Adult_18,input$GI_Intestine_Adult_18,input$GI_Rectum_Adult_18,input$GI_Stomach_Adult_18,input$Heart_Adult_18,input$Liver_Adult_18,input$Lung_Adult_18,input$Muscle_Adult_18,input$Ovary_Adult_18,input$Pancreas_Adult_18,input$Spleen_Adult_18,input$Thymus_Adult_18,input$Vascular_Adult_18,input$Adrenal_Fetal_18,input$Blood_Fetal_18,input$Brain_Fetal_18,input$GI_Intestine_Fetal_18,input$GI_Stomach_Fetal_18,input$Heart_Fetal_18,input$Kidney_Fetal_18,input$Lung_Fetal_18,input$Muscle_Fetal_18,input$Placenta_Fetal_18,input$Thymus_Fetal_18,input$Blood_CellLine_18,input$Cervix_CellLine_18,input$Liver_CellLine_18,input$Lung_CellLine_18)      
      }

    })

  observeEvent(input$selectBack,{
      if (input$selectHMM == '15 model'){
      all_select <- c(input$Blood_Culture,input$Bone_Culture,input$Brain_Culture,input$Breast_Culture,input$ESC_Culture,input$ESC_Derived_Culture,input$Fat_Culture,input$IPSC_Culture,input$Lung_Culture,input$Muscle_Culture,input$Skin_Culture,input$Stromal_Connective_Culture,input$Vascular_Culture,input$Blood_Adult,input$Brain_Adult,input$Breast_Adult,input$Fat_Adult,input$GI_Colon_Adult,input$GI_Duodenum_Adult,input$GI_Esophagus_Adult,input$GI_Intestine_Adult,input$GI_Rectum_Adult,input$GI_Stomach_Adult,input$Heart_Adult,input$Liver_Adult,input$Lung_Adult,input$Muscle_Adult,input$Ovary_Adult,input$Pancreas_Adult,input$Spleen_Adult,input$Thymus_Adult,input$Vascular_Adult,input$Adrenal_Fetal,input$Blood_Fetal,input$Brain_Fetal,input$GI_Intestine_Fetal,input$GI_Stomach_Fetal,input$Heart_Fetal,input$Kidney_Fetal,input$Lung_Fetal,input$Muscle_Fetal,input$Placenta_Fetal,input$Thymus_Fetal,input$Blood_CellLine,input$Cervix_CellLine,input$Liver_CellLine,input$Lung_CellLine)      
      }else{
      all_select <- c(input$Blood_Culture_18,input$Bone_Culture_18,input$Brain_Culture_18,input$Breast_Culture_18,input$ESC_Culture_18,input$ESC_Derived_Culture_18,input$Fat_Culture_18,input$IPSC_Culture_18,input$Lung_Culture_18,input$Muscle_Culture_18,input$Skin_Culture_18,input$Stromal_Connective_Culture_18,input$Vascular_Culture_18,input$Blood_Adult_18,input$Brain_Adult_18,input$Breast_Adult_18,input$Fat_Adult_18,input$GI_Colon_Adult_18,input$GI_Duodenum_Adult_18,input$GI_Esophagus_Adult_18,input$GI_Intestine_Adult_18,input$GI_Rectum_Adult_18,input$GI_Stomach_Adult_18,input$Heart_Adult_18,input$Liver_Adult_18,input$Lung_Adult_18,input$Muscle_Adult_18,input$Ovary_Adult_18,input$Pancreas_Adult_18,input$Spleen_Adult_18,input$Thymus_Adult_18,input$Vascular_Adult_18,input$Adrenal_Fetal_18,input$Blood_Fetal_18,input$Brain_Fetal_18,input$GI_Intestine_Fetal_18,input$GI_Stomach_Fetal_18,input$Heart_Fetal_18,input$Kidney_Fetal_18,input$Lung_Fetal_18,input$Muscle_Fetal_18,input$Placenta_Fetal_18,input$Thymus_Fetal_18,input$Blood_CellLine_18,input$Cervix_CellLine_18,input$Liver_CellLine_18,input$Lung_CellLine_18)     
      }

      fore_index <- match(fore$data,all_select)     
      back$data <- all_select[-fore_index]

    })

  output$summary1 <- renderPrint({
    print(fore$data)
  })

  output$summary2 <- renderPrint({
    print(back$data)
  })


  sample_logic=reactive({
        if (input$selectState=="enhancer"){
          enhancer_logic_15
        }else{
          promoter_logic_15
        }

    })
        len_fore=reactive({length(fore$data)})
        len_back=reactive({length(back$data)})

  foreSum=reactive({

        if (len_fore()==1)
        {
          sample_logic()[,fore$data]
        }else
        {
          apply(sample_logic()[,fore$data],1,sum)
        } 

    })

  backSum=reactive({

        if (len_back()==1)
        {
          sample_logic()[,back$data]
        }else
        {
          apply(sample_logic()[,back$data],1,sum)
        }
    })
  print('t1')

        # print(len_fore())

#table
  table <-eventReactive(input$submit,{
      ptm <- proc.time()

    #cutoff method
    if (input$selectMethod=="cutoff"){
        forePer=foreSum()/len_fore()
        backPer=backSum()/len_back()
        diff=forePer-backPer
        logic=forePer>=input$foreCutoff & backPer<= input$backCutoff 
        final_data=cbind(sample_logic()[logic,1:3],diff[logic])
        len_final=dim(final_data)[2]
        final_data=final_data[order(-final_data[,len_final]),]
        names(final_data)[len_final]="difference"
    #fisher method
    }else if (input$selectMethod=="fisher"){
        fore_zeroN=len_fore()-foreSum()
        back_zeroN=len_back()-backSum()
        combine=cbind(foreSum(),fore_zeroN,backSum(),back_zeroN)
        combine=combine[foreSum()>0,]
        combine=combine+1

        myfun<-function(x) {
          a=fisher.test(matrix(x,nrow=2), alternative = "greater")
          return (a$p.value)
        }
        p_value=apply(combine,1,myfun)
        q_value=p.adjust(p_value,"BH")
        final_data=cbind(sample_logic()[foreSum()>0,][q_value<input$fisherCutoff,1:3],q_value[q_value<input$fisherCutoff])
        len_final=dim(final_data)[2]
        final_data=final_data[order(final_data[,len_final]),]
        names(final_data)[len_final]="q-value"
      }else {
        if (input$selectClusterMethod=='median'){
            if (len_fore()==1)
            {
              for_den=cluster_density_15[,fore$data]
            }else
            {
              for_den=apply(cluster_density_15[,fore$data],1,median)
            }

            if (len_back()==1)
            {
              back_den=cluster_density_15[,back$data]
            }else
            {
              back_den=apply(cluster_density_15[,back$data],1,median)
            }
        }else{
            if (len_fore()==1)
            {
              for_den=cluster_density_15[,fore$data]
            }else
            {
              for_den=apply(cluster_density_15[,fore$data],1,mean)
            }

            if (len_back()==1)
            {
              back_den=cluster_density_15[,back$data]
            }else
            {
              back_den=apply(cluster_density_15[,back$data],1,mean)
            }
        }
        len=dim(cluster_density_15)[2]
        cluster_Name=cluster_density_15[for_den>back_den*input$clusterRatio & for_den>input$clusterCutoff,len]
        #print(cluster_density_15[for_den>back_den*input$clusterRatio & for_den>input$clusterCutoff,len])
        #cluserName <- cluster_density_15[for_den>back_den*input$clusterRatio & for_den>input$clusterCutoff,len]
        #print(cluster_Name)

        if (length(cluster_Name)==1)
        {
          logic= cluster_all_15_last==cluster_Name[1]
        }else   
        {
          base='cluster_all_15_last=='
          exp='cluster_all_15_last==cluster_Name[1]'
          for (x in cluster_Name[c(2:length(cluster_Name))])
          {
             exp=paste(exp,'|',base,x,sep='')
          }
          logic=eval(parse(text = exp))
        }
        final_data=cluster_all_15[logic,c(1:3,len_all)]


      }
    print(proc.time() - ptm)
    session$sendCustomMessage("download_ready", list(fileSize=floor(runif(1) * 10000)))
    final_data

    }) #end of table

  #output table
  output$table <- renderTable({table()})
  
  output$data_file <- downloadHandler(
    filename = function() { paste('data', '.txt', sep='') },
    content = function(file) {
      write.table(table(), file, row.names=FALSE,col.names=TRUE,quote=FALSE,sep='\t')
    })


}


shinyApp(ui = ui, server = server)