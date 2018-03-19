﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CRM.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <meta charset="utf-8">
    <title>Realm - Forms</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Bluth Company">
    <link rel="shortcut icon" href="assets/ico/favicon.html">
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/theme.css" rel="stylesheet">
    <link href="assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/css/alertify.css" rel="stylesheet">
    <link rel="Favicon Icon" href="favicon.ico">
    <link href="http://fonts.useso.com/css?family=Open+Sans:400,700" rel="stylesheet" type="text/css">
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <link href="assets/css/colorpicker.css" rel="stylesheet">
    <link href="assets/css/datepicker.css" rel="stylesheet">
    <link href="assets/css/timepicker.css" rel="stylesheet">
    <link href="assets/css/select2.css" rel="stylesheet">
  </head>
  <body>
  <div id="wrap">
    <div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container-fluid">
           <a class="btn btn-navbar visible-phone" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
           <a class="btn btn-navbar slide_menu_left visible-tablet">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>

          <div class="top-menu visible-desktop">
            <ul class="pull-left">
              <li><a id="A1"
                      style="float:left;font-style: oblique; text-transform: uppercase; font-variant: inherit; font-size: xx-large;">员工客户管理系统</a></li>
              <li><a id="messages"  href="#"><i class="icon-envelope"></i> 消息通知</a></li>
              <li><a id="notifications" href="#"><i class="icon-globe"></i> Notifications</a></li>
            </ul>
            <ul class="pull-right">  
              <li><a href="login.html"><i class="icon-off"></i> Logout</a></li>
            </ul>
          </div>

          <div class="top-menu visible-phone visible-tablet">
            <ul class="pull-right">  
              <li><a title="link to View all Messages page, no popover in phone view or tablet" href="#"><i class="icon-envelope"></i></a></li>
              <li><a title="link to View all Notifications page, no popover in phone view or tablet" href="#"><i class="icon-globe"></i></a></li>
              <li><a href="login.html"><i class="icon-off"></i></a></li>
            </ul>
          </div>

        </div>
      </div>
    </div>

    <div class="container-fluid">
     
      <!-- Side menu -->  
      <div class="sidebar-nav nav-collapse collapse">
       <asp:Literal ID="Literal1" runat="server"></asp:Literal>
   <asp:Literal ID="Literal2" runat="server"></asp:Literal>



    

        <!--div class="accordion" id="accordion2">
          <div class="accordion-group">
            <div class="accordion-heading">
              <a class="accordion-toggle b_F79999" href="index-2.html"><i class="icon-dashboard"></i> <span>Dashboard</span></a>
            </div>
          </div>
          <div class="accordion-group">
            <div class="accordion-heading">
              <a class="accordion-toggle b_C3F7A7" data-toggle="collapse" data-parent="#accordion2" href="#collapse1"><i class="icon-magic"></i> <span>Features</span></a>
            </div>
            <div id="collapse1" class="accordion-body in collapse" style="height:auto">
              <div class="accordion-inner">
                <a class="accordion-toggle" href="ui_features.html"><i class="icon-star"></i> UI Features</a>
                <a class="accordion-toggle active" href="forms.html"><i class="icon-list-alt"></i> Forms</a>
                <a class="accordion-toggle" href="tables.html"><i class="icon-table"></i> Tables</a>
                <a class="accordion-toggle" href="buttons.html"><i class="icon-circle"></i> Buttons</a>
              </div>
            </div>
          </div>
          <div class="accordion-group">
            <div class="accordion-heading">
              <a class="accordion-toggle b_9FDDF6 collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapse2"><i class="icon-reorder"></i> <span>Components</span></a>
            </div>
            <div id="collapse2" class="accordion-body collapse">
              <div class="accordion-inner">
                <a class="accordion-toggle" href="notifications.html"><i class="icon-rss"></i> Notifications</a>
                <a class="accordion-toggle" href="calendar.html"><i class="icon-calendar"></i> Calendar</a>
                <a class="accordion-toggle" href="gallery.html"><i class="icon-picture"></i> Gallery</a>
              </div>
            </div>
          </div>
         
          <div class="accordion-group">
            <div class="accordion-heading">
              <a class="accordion-toggle b_F6F1A2" href="tasks.html"><i class="icon-tasks"></i> <span>Tasks</span></a>
            </div>
          </div>
          <div class="accordion-group">
            <div class="accordion-heading">
              <a class="accordion-toggle b_C1F8A9" href="analytics.html"><i class="icon-bar-chart"></i> <span>Analytics</span></a>
            </div>
          </div> 
          <div class="accordion-group">
            <div class="accordion-heading">
              <a class="accordion-toggle b_9FDDF6" href="tickets.html"><i class="icon-bullhorn"></i> <span>Support Tickets</span></a>
            </div>
          </div> 
          <div class="accordion-group">
            <div class="accordion-heading">
              <a class="accordion-toggle b_F5C294" href="users.html"><i class="icon-user"></i> <span>Users</span></a>
            </div>
          </div>      
        </div-->
      </div>
      <!-- /Side menu -->

      <!-- Main window -->
      <div class="main_container" id="forms_page">
        <div class="row-fluid">
          <ul class="breadcrumb">
            <li><a href="#">Home</a> <span class="divider">/</span></li>
            <li><a href="#">Features</a> <span class="divider">/</span></li>
            <li class="active">Forms</li>
          </ul>
          <h2 class="heading">
                Forms
                <div class="btn-group pull-right">
                  <button class="btn"><i class="icon-download-alt"></i> Export</button>
                  <button class="btn"><i class="icon-envelope"></i> Email</button>
                  <button class="btn"><i class="icon-cog"></i> Settings</button>
                </div>
          </h2>
        </div>
        <div class="row-fluid">
          <div class="widget widget-padding span12">
            <div class="widget-header">
              <i class="icon-external-link"></i><h5>Documentation</h5>
              <div class="widget-buttons">
                  <a href="#" data-title="Collapse" data-collapsed="false" class="tip collapse"><i class="icon-chevron-up"></i></a>
              </div>
            </div>
            <div class="widget-body">
              <div class="alert alert-info" style="margin:0;">
                <strong>This page includes multiple plugins, here are the documentation links.</strong><br> 
                <ul>     
                  <li><a href="http://twitter.github.com/bootstrap/base-css.html#forms">Bootstrap Forms</a></li>
                  <li><a href="http://ivaynberg.github.com/select2/">Select2</a></li>
                  <li><a href="http://www.eyecon.ro/bootstrap-colorpicker/">ColorPicker</a></li>
                  <li><a href="http://www.eyecon.ro/bootstrap-datepicker/">DatePicker</a></li>
                  <li><a href="http://jdewit.github.com/bootstrap-timepicker/">TimePicker</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>  
        <div class="row-fluid">
          <div class="widget widget-padding span12">
            <div class="widget-header">
              <i class="icon-list-alt"></i><h5>Basic Inputs</h5>
              <div class="widget-buttons">
                  <a href="#" data-title="Collapse" data-collapsed="false" class="tip collapse"><i class="icon-chevron-up"></i></a>
              </div>
            </div>
            <div class="widget-body">
              <div class="widget-forms clearfix">
                <form class="form-horizontal">
                  <div class="control-group">
                    <label class="control-label">Basic Input</label>
                    <div class="controls">
                      <input class="span7" type="text" placeholder="Type something…">
                      <span class="help-inline">Helpful text here.</span>
                    </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label">Disabled Input</label>
                    <div class="controls">
                      <input class="span7" disabled="" type="text" placeholder="You can't type anything…">
                    </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label">Tooltip Input</label>
                    <div class="controls">
                      <input class="span7 tip" data-title="A tooltip for the input" type="text" placeholder="Hover for tooltip…">
                    </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label">Popover Input</label>
                    <div class="controls">
                      <input class="span7 pop" data-title="A popover for the input" data-content="Place some more information about the input here" type="text" placeholder="Click for popup…">
                    </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label">Type ahead Input</label>
                    <div class="controls">
                     <input class="span7" type="text" data-source="[&quot;Alabama&quot;,&quot;Alaska&quot;,&quot;Arizona&quot;,&quot;Arkansas&quot;,&quot;California&quot;,&quot;Colorado&quot;,&quot;Connecticut&quot;,&quot;Delaware&quot;,&quot;Florida&quot;,&quot;Georgia&quot;,&quot;Hawaii&quot;,&quot;Idaho&quot;,&quot;Illinois&quot;,&quot;Indiana&quot;,&quot;Iowa&quot;,&quot;Kansas&quot;,&quot;Kentucky&quot;,&quot;Louisiana&quot;,&quot;Maine&quot;,&quot;Maryland&quot;,&quot;Massachusetts&quot;,&quot;Michigan&quot;,&quot;Minnesota&quot;,&quot;Mississippi&quot;,&quot;Missouri&quot;,&quot;Montana&quot;,&quot;Nebraska&quot;,&quot;Nevada&quot;,&quot;New Hampshire&quot;,&quot;New Jersey&quot;,&quot;New Mexico&quot;,&quot;New York&quot;,&quot;North Dakota&quot;,&quot;North Carolina&quot;,&quot;Ohio&quot;,&quot;Oklahoma&quot;,&quot;Oregon&quot;,&quot;Pennsylvania&quot;,&quot;Rhode Island&quot;,&quot;South Carolina&quot;,&quot;South Dakota&quot;,&quot;Tennessee&quot;,&quot;Texas&quot;,&quot;Utah&quot;,&quot;Vermont&quot;,&quot;Virginia&quot;,&quot;Washington&quot;,&quot;West Virginia&quot;,&quot;Wisconsin&quot;,&quot;Wyoming&quot;]" data-items="4" data-provide="typeahead" style="margin: 0 auto;" placeholder="Type here for auto complete…">
                    </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label">Prepended Input</label>
                      <div class="controls">
                        <div class="input-prepend">
                           <span class="add-on">#</span><input class="span7" type="text" placeholder="prepend">       
                        </div>
                     </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label">Appended Input</label>
                      <div class="controls">
                        <div class="input-append">
                           <input class="span7" type="text" placeholder="5.000"><span class="add-on">$</span>
                        </div>
                     </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label">Dropdown Button</label>
                      <div class="controls">
                        <div class="dropdown">
                          <a class="dropdown-toggle btn" data-toggle="dropdown" href="#">Dropdown Button <i class="icon-caret-down"></i></a>
                          <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                            <li><a href="#">First Dropdown</a></li>
                            <li><a href="#">Second Dropdown</a></li>
                            <li><a href="#">Third Dropdown</a></li>
                            <li><a href="#">Fourth Dropdown</a></li>
                          </ul>
                        </div>
                     </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label">Dropdown</label>
                      <div class="controls">
                        <select tabindex="1" data-placeholder="Select here.." class="span7">
                           <option value=""></option>
                           <option value="Category 1">First Dropdown</option>
                           <option value="Category 2">Second Dropdown</option>
                           <option value="Category 3">Third Dropdown</option>
                           <option value="Category 4">Fourth Dropdown</option>
                        </select>
                     </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label">Advanced Dropdown</label>
                      <div class="controls">
                        <select tabindex="1" data-placeholder="Select here.." class="span7">
                           <option value=""></option>
                           <optgroup label="First and second">
                              <option value="Category 1">First Dropdown</option>
                              <option value="Category 1">Second Dropdown</option>
                            </optgroup>
                            <optgroup label="Third, fourth and fifth">
                              <option value="Category 2">Third Dropdown</option>
                              <option value="Category 2">Fourth Dropdown</option>
                              <option value="Category 2">Fifth Dropdown</option>
                            </optgroup>
                        </select>
                     </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label">Custom Dropdown</label>
                      <div class="controls">
                        <select id="select2-basic" tabindex="1" data-placeholder="Select here.." class="span7">
                           <option value=""></option>
                           <optgroup label="First and second">
                              <option value="Category 1">First Dropdown</option>
                              <option value="Category 2">Second Dropdown</option>
                            </optgroup>
                            <optgroup label="Third, fourth and fifth">
                              <option value="Category 3">Third Dropdown</option>
                              <option value="Category 4">Fourth Dropdown</option>
                              <option value="Category 5">Fifth Dropdown</option>
                            </optgroup>
                        </select>
                     </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label">Multi-Value Dropdown</label>
                      <div class="controls">
                        <select id="select2-multi-value" multiple="" class="span7">
                           <option></option>
                           <optgroup label="First and second">
                              <option value="Category 1">First Dropdown</option>
                              <option value="Category 2">Second Dropdown</option>
                            </optgroup>
                            <optgroup label="Third, fourth and fifth">
                              <option value="Category 3">Third Dropdown</option>
                              <option value="Category 4">Fourth Dropdown</option>
                              <option value="Category 5">Fifth Dropdown</option>
                            </optgroup>
                        </select>
                     </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label">Max-Value Dropdown</label>
                      <div class="controls">
                        <select id="select2-max-value" multiple="" class="span7">
                           <option></option>
                           <optgroup label="First and second">
                              <option value="Category 1">First Dropdown</option>
                              <option value="Category 2">Second Dropdown</option>
                            </optgroup>
                            <optgroup label="Third, fourth and fifth">
                              <option value="Category 3">Third Dropdown</option>
                              <option value="Category 4">Fourth Dropdown</option>
                              <option value="Category 5">Fifth Dropdown</option>
                            </optgroup>
                        </select>
                     </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label">Tags Dropdown</label>
                      <div class="controls">
                        <input id="select2-tags" multiple="" class="span7">
                     </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label">Color Picker</label>
                      <div class="controls">
                        <div class="input-append color span5 colorpicker colorpicker-rgb" data-color="rgb(255, 146, 180)" data-color-format="rgb">
                          <input type="text" value="">
                          <span class="add-on"><i style="background-color: rgb(255, 146, 180)"></i></span>
                        </div>
                      </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label">Date Picker</label>
                      <div class="controls">
                        <div class="input-append date span5 datepicker datepicker-basic" data-date="12-02-2012" data-date-format="dd-mm-yyyy">
                          <input size="16" type="text" value="12-02-2012">
                          <span class="add-on"><i class="icon-th"></i></span>
                        </div>
                      </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label">Time Picker</label>
                      <div class="controls">
                        <div class="input-append bootstrap-timepicker-component span5">
                          <input type="text" class="input-small timepicker-12hrs">
                          <span class="add-on">
                            <i class="icon-time"></i>
                          </span>
                        </div>
                      </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label">Text Area</label>
                      <div class="controls">
                        <textarea class="span7" rows="5" style="height:100px;"></textarea>
                      </div>
                  </div>
                </form>
              </div>
            </div>
            <div class="widget-footer">
               <button class="btn btn-primary" type="submit">Save</button>
               <button class="btn" type="button">Cancel</button>
            </div>
          </div>
        </div>  
        <div class="row-fluid">
          <div class="widget widget-padding span12">
            <div class="widget-header"><i class="icon-list-alt"></i><h5>Time Picker</h5></div>
            <div class="widget-body">
              <div class="widget-forms clearfix">
                <form class="form-horizontal">
                  <div class="control-group">
                    <label class="control-label">12hrs</label>
                      <div class="controls">
                        <div class="input-append bootstrap-timepicker-component">
                          <input type="text" class="input-small timepicker-12hrs">
                          <span class="add-on">
                            <i class="icon-time"></i>
                          </span>
                        </div>
                        <span class="help-inline"></span>
                      </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label">24hrs</label>
                      <div class="controls">
                        <div class="input-append bootstrap-timepicker-component">
                          <input type="text" class="input-small timepicker-24hrs">
                          <span class="add-on">
                            <i class="icon-time"></i>
                          </span>
                        </div>
                        <span class="help-inline"><code>showMeridian:false</code></span>

                      </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label">With Seconds</label>
                      <div class="controls">
                        <div class="input-append bootstrap-timepicker-component">
                          <input type="text" class="input-small timepicker-seconds">
                          <span class="add-on">
                            <i class="icon-time"></i>
                          </span>
                        </div>
                        <span class="help-inline"><code>showSeconds:true</code></span>

                      </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label">In a modal</label>
                      <div class="controls">
                        <div class="input-append bootstrap-timepicker-component">
                          <input type="text" class="input-small timepicker-modal">
                          <span class="add-on">
                            <i class="icon-time"></i>
                          </span>
                        </div>
                        <span class="help-inline"><code>modalBackdrop:true, showInputs:false, template:'modal'</code></span>
                      </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
        <div class="row-fluid">
          <div class="widget widget-padding span12">
            <div class="widget-header"><i class="icon-list-alt"></i><h5>Date Picker</h5></div>
            <div class="widget-body">
              <div class="widget-forms clearfix">
                <form class="form-horizontal">
                  <div class="control-group">
                    <label class="control-label">Basic</label>
                      <div class="controls">
                        <div class="input-append date datepicker datepicker-basic" data-date="12-02-2012" data-date-format="dd-mm-yyyy">
                          <input size="16" type="text" value="12-02-2012">
                          <span class="add-on"><i class="icon-calendar"></i></span>
                        </div>
                      </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label">Restricted</label>
                      <div class="controls">
                        <div class="input-append date datepicker datepicker-basic" data-date="12-02-2012" data-date-format="dd-mm-yyyy">
                          <input readonly="" size="16" type="text" value="12-02-2012">
                          <span class="add-on"><i class="icon-calendar"></i></span>
                        </div>
                        <span class="help-inline"><code>readonly=""</code></span>
                      </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label">Start with years</label>
                      <div class="controls">
                        <div class="input-append date datepicker" id="datepicker-years" data-date-format="dd-mm-yyyy" value="12-02-2012" data-date="12-02-2012">
                          <input readonly="" size="16" type="text">
                          <span class="add-on"><i class="icon-calendar"></i></span>
                        </div>
                        <span class="help-inline"><code>viewMode:2</code></span>
                      </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
        <div class="row-fluid">
          <div class="widget widget-padding span12">
            <div class="widget-header"><i class="icon-list-alt"></i><h5>Color Picker</h5></div>
            <div class="widget-body">
              <div class="widget-forms clearfix">
                <form class="form-horizontal">
                  <div class="control-group">
                    <label class="control-label">RGB</label>
                      <div class="controls">
                        <div class="input-append color colorpicker colorpicker-rgb" data-color="rgb(255, 146, 180)" data-color-format="rgb">
                          <input type="text" value="">
                          <span class="add-on"><i style="background-color: rgb(255, 146, 180)"></i></span>
                        </div>
                        <span class="help-inline"><code>format:'rgb'</code></span>
                      </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label">RGBA</label>
                      <div class="controls">
                        <div class="input-append color colorpicker colorpicker-rgba" data-color="rgb(255, 146, 180)" data-color-format="rgb">
                          <input type="text" value="">
                          <span class="add-on"><i style="background-color: rgb(255, 146, 180)"></i></span>
                        </div>
                        <span class="help-inline"><code>format:'rgba'</code></span>
                      </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label">HEX</label>
                      <div class="controls">
                        <div class="input-append color colorpicker colorpicker-hex" data-color="rgb(255, 146, 180)" data-color-format="rgb">
                          <input type="text" value="">
                          <span class="add-on"><i style="background-color: rgb(255, 146, 180)"></i></span>
                        </div>
                        <span class="help-inline"><code>format:'hex'</code></span>
                      </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
        <div class="row-fluid">
          <div class="widget widget-padding span6">
            <div class="widget-header"><i class="icon-list-alt"></i><h5>Input fields classes</h5></div>
            <div class="widget-header-under">
                <label>Input fields with various classes</label>
            </div>
            <div class="widget-body" style="height: 361px;">
              <div class="widget-forms clearfix">
                <form class="form-horizontal">
                  <div class="control-group">
                    <label class="control-label">Focused state</label>
                    <div class="controls">
                      <input type="text" class="focused">
                      <span class="help-inline"><code>class="focused"</code></span>

                    </div>
                  </div>

                  <div class="control-group">
                    <label class="control-label">Error state</label>
                    <div class="controls">
                      <input type="text" class="error">
                      <span class="help-inline"><code>class="error"</code></span>
                    </div>
                  </div>

                  <div class="control-group">
                    <label class="control-label">Warning state</label>
                    <div class="controls">
                      <input type="text" class="warning">
                      <span class="help-inline"><code>class="warning"</code></span>
                    </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label">Success state</label>
                    <div class="controls">
                      <input type="text" class="success">
                      <span class="help-inline"><code>class="success"</code></span>
                    </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label">Disabled state</label>
                    <div class="controls">
                      <input type="text" disabled="disabled">
                      <span class="help-inline"><code>disabled="disabled"</code></span>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>

          <div class="widget widget-padding span6">
            <div class="widget-header"><i class="icon-list-alt"></i><h5>Input fields</h5></div>
            <div class="widget-header-under">
                <label>Form elements with <code>.span*</code> classes</label>
            </div>
            <div class="widget-body" style="height: 360px;">
              <div class="widget-forms clearfix">
                <div class="control-group">
                  <div class="controls">
                    <input type="text" class="span3" placeholder=".span3">
                  </div>
                </div>                
                <div class="control-group">
                  <div class="controls">
                    <input type="text" class="span5" placeholder=".span5">
                  </div>
                </div>           
                <div class="control-group">
                  <div class="controls">
                    <input type="text" class="span7" placeholder=".span7">
                  </div>
                </div>        
                <div class="control-group">
                  <div class="controls">
                    <select class="span3">
                      <option>1</option>
                      <option>2</option>
                      <option selected="selected">3</option>
                    </select>
                  </div>
                </div>
                <div class="control-group">
                  <div class="controls">
                    <select class="span5">
                      <option>1</option>
                      <option>2</option>
                      <option>2</option>
                      <option>4</option>
                      <option selected="selected">5</option>
                    </select>
                  </div>
                </div>
                <div class="control-group">
                  <div class="controls">
                    <select class="span7">
                      <option>1</option>
                      <option>2</option>
                      <option>3</option>
                      <option>4</option>
                      <option>5</option>
                      <option>6</option>
                      <option selected="selected">7</option>
                    </select>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row-fluid">
          <div class="widget widget-padding span6">
            <div class="widget-header"><i class="icon-list-alt"></i><h5>Inline forms</h5></div>
            <div class="widget-body" style="height: 250px;">
              <div class="widget-forms clearfix">
                <form class="form-inline">
                  <input type="text" class="span4" placeholder="Email">
                  <input type="password" class="span4" placeholder="Password">
                  <button type="submit" class="btn btn-success">Sign in</button>
                </form>
                <form class="form-inline" style="margin-top: 15px;">
                  <input type="text" class="span4" placeholder="Username">
                  <div class="input-append">
                    <input type="text" placeholder="5.000"><span class="add-on">$</span>
                  </div>
                  <button type="submit" class="btn btn-success">Submit</button>
                </form>
              </div>
            </div>
          </div>
          <div class="widget widget-padding span6">
            <div class="widget-header"><i class="icon-list-alt"></i><h5>Checkboxes and Radios</h5></div>
            <div class="widget-body" style="height: 250px;">
              <div class="widget-forms clearfix">
                <form class="form-horizontal">
                  <div class="control-group">
                    <label class="control-label">Checkboxes</label>
                    <div class="controls">
                      <label class="checkbox">
                        <input type="checkbox" value="">
                        Option one
                      </label>
                      <label class="checkbox">
                        <input type="checkbox" value="">
                        Option two
                      </label>
                      <label class="checkbox">
                        <input type="checkbox" value="">
                        Option three
                      </label>
                    </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label">Radiobuttons</label>
                    <div class="controls">
                       
                      <label class="radio">
                        <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
                        Option one
                      </label> 
                      <label class="radio">
                        <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
                        Option two
                      </label> 
                      <label class="radio">
                        <input type="radio" name="optionsRadios" id="optionsRadios3" value="option3">
                        Option three
                      </label>
                    </div>
                  </div>
                </form>
              </div>
            </div>
        </div>

        <div class="row-fluid">
          
          </div>
        </div>
      </div>
      <!-- /Main window -->
      
    </div><!--/.fluid-container-->
    </div><!-- wrap ends-->

    <script type="text/javascript" src="assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="assets/js/raphael-min.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap.js"></script>
    <script type="text/javascript" src='assets/js/sparkline.js'></script>
    <script type="text/javascript" src='assets/js/morris.min.js'></script>
    <script type="text/javascript" src="assets/js/jquery.dataTables.min.js"></script>   
    <script type="text/javascript" src="assets/js/jquery.masonry.min.js"></script>   
    <script type="text/javascript" src="assets/js/jquery.imagesloaded.min.js"></script>   
    <script type="text/javascript" src="assets/js/jquery.facybox.js"></script>   
    <script type="text/javascript" src="assets/js/jquery.alertify.min.js"></script> 
    <script type="text/javascript" src="assets/js/jquery.knob.js"></script>
    <script type='text/javascript' src='assets/js/fullcalendar.min.js'></script>
    <script type='text/javascript' src='assets/js/jquery.gritter.min.js'></script>
    <script type="text/javascript" src="assets/js/realm.js"></script>

    <script type="text/javascript" src="assets/js/select2.min.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap-colorpicker.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap-timepicker.js"></script>
  </body>
</html>
