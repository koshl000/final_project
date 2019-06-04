<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="mobile-menu-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="mobile-menu">
                    <nav id="dropdown">
                        <ul class="mobile-menu-nav">
                            <li><a data-toggle="collapse" data-target="#Charts" href="#">기초정보관리</a>
                                <ul class="collapse dropdown-header-top">
                                    <li><a href="index.html">Dashboard One</a></li>
                                    <li><a href="index-2.html">Dashboard Two</a></li>
                                    <li><a href="index-3.html">Dashboard Three</a></li>
                                    <li><a href="index-4.html">Dashboard Four</a></li>
                                    <li><a href="analytics.html">Analytics</a></li>
                                    <li><a href="widgets.html">Widgets</a></li>
                                </ul>
                            </li>
                            <li><a data-toggle="collapse" data-target="#demoevent" href="#">사용자관리</a>
                                <ul id="demoevent" class="collapse dropdown-header-top">
                                    <li><a href="inbox.html">Inbox</a></li>
                                    <li><a href="view-email.html">View Email</a></li>
                                    <li><a href="compose-email.html">Compose Email</a></li>
                                </ul>
                            </li>
                            <li><a data-toggle="collapse" data-target="#democrou" href="#">교육과정관리</a>
                                <ul id="democrou" class="collapse dropdown-header-top">
                                    <li><a href="animations.html">Animations</a></li>
                                    <li><a href="google-map.html">Google Map</a></li>
                                    <li><a href="data-map.html">Data Maps</a></li>
                                    <li><a href="code-editor.html">Code Editor</a></li>
                                    <li><a href="image-cropper.html">Images Cropper</a></li>
                                    <li><a href="wizard.html">Wizard</a></li>
                                </ul>
                            </li>
                            <li><a data-toggle="collapse" data-target="#demolibra" href="#">강의운영관리</a>
                                <ul id="demolibra" class="collapse dropdown-header-top">
                                    <li><a href="flot-charts.html">Flot Charts</a></li>
                                    <li><a href="bar-charts.html">Bar Charts</a></li>
                                    <li><a href="line-charts.html">Line Charts</a></li>
                                    <li><a href="area-charts.html">Area Charts</a></li>
                                </ul>
                            </li>
                            <li><a data-toggle="collapse" data-target="#demodepart" href="#">증명서관리</a>
                                <ul id="demodepart" class="collapse dropdown-header-top">
                                    <li><a href="normal-table.html">Normal Table</a></li>
                                    <li><a href="data-table.html">Data Table</a></li>
                                </ul>
                            </li>
                            <li><a data-toggle="collapse" data-target="#demo" href="#">게시판관리</a>
                                <ul id="demo" class="collapse dropdown-header-top">
                                    <li><a href="form-elements.html">Form Elements</a></li>
                                    <li><a href="form-components.html">Form Components</a></li>
                                    <li><a href="form-examples.html">Form Examples</a></li>
                                </ul>
                            </li>
                            <li><a data-toggle="collapse" data-target="#Miscellaneousmob" href="#">통계관리</a>
                                <ul id="Miscellaneousmob" class="collapse dropdown-header-top">
                                    <li><a href="notification.html">Notifications</a>
                                    </li>
                                    <li><a href="alert.html">Alerts</a>
                                    </li>
                                    <li><a href="modals.html">Modals</a>
                                    </li>
                                    <li><a href="buttons.html">Buttons</a>
                                    </li>
                                    <li><a href="tabs.html">Tabs</a>
                                    </li>
                                    <li><a href="accordion.html">Accordion</a>
                                    </li>
                                    <li><a href="dialog.html">Dialogs</a>
                                    </li>
                                    <li><a href="popovers.html">Popovers</a>
                                    </li>
                                    <li><a href="tooltips.html">Tooltips</a>
                                    </li>
                                    <li><a href="dropdown.html">Dropdowns</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a data-toggle="collapse" data-target="#Pagemob" href="#">Pages</a>
                                <ul id="Pagemob" class="collapse dropdown-header-top">
                                    <li><a href="contact.html">Contact</a>
                                    </li>
                                    <li><a href="invoice.html">Invoice</a>
                                    </li>
                                    <li><a href="typography.html">Typography</a>
                                    </li>
                                    <li><a href="color.html">Color</a>
                                    </li>
                                    <li><a href="login-register.html">Login Register</a>
                                    </li>
                                    <li><a href="404.html">404 Page</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Mobile Menu end -->
<!-- Main Menu area start-->
<div class="main-menu-area mg-tb-40">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <ul class="nav nav-tabs notika-menu-wrap menu-it-icon-pro">
                    <li><a href="${pageContext.request.contextPath }/adminMain/basic"><i class="notika-icon notika-house"></i>기초정보관리</a></li>
                    <li><a href="${pageContext.request.contextPath }/adminMain/user"><i class="notika-icon notika-support"></i>사용자관리</a></li>
                    <li><a data-toggle="tab" href="#lecture" ><i class="notika-icon notika-edit"></i>교육과정관리</a></li>
                    <li><a data-toggle="tab" href="#operation" ><i class="notika-icon notika-windows"></i>강의운영관리</a></li>
                    <li><a href="${pageContext.request.contextPath }/adminMain/certificate"><i class="notika-icon notika-form"></i>증명서관리</a></li>
                    <li><a href="${pageContext.request.contextPath }/adminMain/board"><i class="notika-icon notika-edit"></i>게시판관리</a></li>
                    <li><a data-toggle="tab" href="#stats" ><i class="notika-icon notika-bar-chart"></i>통계관리</a></li>
                    <li><a data-toggle="tab" href="#portal" ><i class="notika-icon notika-app"></i>포털관리(일정 미구현)</a></li>
                    <li><a data-toggle="tab" href="#sms" ><i class="notika-icon notika-mail"></i>SMS관리</a></li>
                </ul>
                <div class="tab-content custom-menu-content">
                    <div id="lecture" class="tab-pane notika-tab-menu-bg animated flipInX">
                        <ul class="notika-main-menu-dropdown">
                            <li><a href="${pageContext.request.contextPath }/curriculum/subject">과목관리</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath }/curriculum/lecture">강좌관리</a>
                            </li>
                        </ul>
                    </div>
                    <div id="operation" class="tab-pane notika-tab-menu-bg animated flipInX">
                        <ul class="notika-main-menu-dropdown">
                            <li><a href="${pageContext.request.contextPath }/operation/policy">평가정책관리</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath }/operation/attend">수강신청관리</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath }/operation/attendList">수강관리</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath }/operation/assignment">과제물관리</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath }/operation/exam">시험관리</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath }/operation/evaluation">강의평가관리</a>
                            </li>
                        </ul>
                    </div>
                    <div  id="stats" class="tab-pane notika-tab-menu-bg animated flipInX">
                        <ul  class="notika-main-menu-dropdown">
                            <li><a href="${pageContext.request.contextPath }/statistics/subject">과목통계</a>
                            </li>
                            <li><a href="#">사용자통계</a>
                            </li>
                            <li><a href="#">시스템접속통계</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath }/statistics/behavior">교수활동통계</a>
                            </li>
                        </ul>
                    </div>
                    <div id="portal" class="tab-pane notika-tab-menu-bg animated flipInX">
                        <ul class="notika-main-menu-dropdown">
                            <li><a href="${pageContext.request.contextPath }/portal/popup">팝업공지</a>
                            </li>
                            <li><a href="#">일정</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath }/portal/system">시스템관리</a>
                            </li>
                        </ul>
                    </div>
                    <div id="sms" class="tab-pane notika-tab-menu-bg animated flipInX">
                        <ul class="notika-main-menu-dropdown">
                            <li><a href="${pageContext.request.contextPath }/sms/smsGroupList">SMS그룹관리</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath }/sms/smsSendList">SMS발송내역</a>
                            </li>
                        </ul>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

