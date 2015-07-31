<%--

    Licensed to Apereo under one or more contributor license
    agreements. See the NOTICE file distributed with this work
    for additional information regarding copyright ownership.
    Apereo licenses this file to you under the Apache License,
    Version 2.0 (the "License"); you may not use this file
    except in compliance with the License.  You may obtain a
    copy of the License at the following location:

      http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.

--%>

    <!-- Add/Manage Service Form -->
    <form class="service-editor form-horizontal" id="serviceForm" ng-controller="ServiceFormController as serviceFormCtrl" ng-submit="serviceFormCtrl.validateAndSave()" novalidate>
        <h1>
            <i class="fa fa-plus-circle"></i>
            <span ng-if="action.isSelected('edit')"><spring:message code="services.form.header.page.editService" /></span>
            <span ng-if="!action.isSelected('edit')"><spring:message code="services.form.header.page.addService" /></span>
        </h1>

        <div class="alert alert-{{ serviceFormCtrl.alert.type }}" role="alert" ng-show="serviceFormCtrl.alert">
            <p>
                <i class="fa fa-lg fa-{{ serviceFormCtrl.alert.type === 'danger' ? 'exclamation-triangle' : 'info-circle' }}"></i>
                <span ng-if="serviceFormCtrl.alert.name === 'notloaded'">
                    <spring:message code="services.form.alert.loadingFailed" />
                </span>
                <span ng-if="serviceFormCtrl.alert.name === 'notvalid'">
                    <spring:message code="services.form.alert.formHasErrors" />
                </span>
                <span ng-if="serviceFormCtrl.alert.name === 'notsaved'">
                    <spring:message code="services.form.alert.unableToSave" />
                </span>
                <span ng-if="serviceFormCtrl.alert.name === 'requiredText'">
                    <spring:message code="services.form.requiredText" />
                </span>
                <span ng-if="serviceFormCtrl.alert.name === 'instructions'">
                    <spring:message code="services.form.instructions" />
                </span>
            </p>
        </div>

        <div class="row col-sm-12">
            <div class="col-sm-6">
                <div class="row">
                    <div class="col-sm-12">
                        <!-- Service Enabled? -->
                        <div class="form-group">
                            <label class="col-sm-3 important" for="casEnabled">
                                <spring:message code="services.form.label.sas.casEnabled" />
                                <i class="fa fa-lg fa-question-circle form-tooltip-icon" data-toggle="tooltip" data-placement="top"
                                    title="<spring:message code="services.form.tooltip.sas.casEnabled" />"></i>
                            </label>
                            <div class="col-sm-1">
                                <div class="checkbox checkbox-inline">
                                    <input type="checkbox" id="casEnabled" ng-model="serviceFormCtrl.formData.supportAccess.casEnabled" />
                                </div>
                            </div>
                            <div class="col-sm-8">
                                <div class="alert alert-danger" role="alert" ng-if="!serviceFormCtrl.formData.supportAccess.casEnabled">
                                    <p>
                                        <i class="fa fa-lg fa-info-circle"></i>
                                        <spring:message code="services.form.warning.casDisabled" />
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Service ID -->
                <div class="form-group">
                    <label class="col-sm-3 required" for="serviceId">
                        <spring:message code="services.form.label.serviceId" />
                        <i class="fa fa-lg fa-question-circle form-tooltip-icon" data-toggle="tooltip" data-placement="top" title="<spring:message code="services.form.tooltip.serviceId" />"></i>
                    </label>
                    <div class="col-sm-9">
                        <div class="input-group">
                            <div class="input-group-addon input-group-required" title="<spring:message code="services.form.required" />"><i class="fa fa-exclamation-triangle"></i></div>
                            <input type="text" class="form-control" id="serviceId" ng-model="serviceFormCtrl.formData.serviceId">
                        </div>
                    </div>
                </div>

                <!-- Service Name -->
                <div class="form-group">
                    <label class="col-sm-3 required" for="serviceName">
                        <spring:message code="services.form.label.name" />
                        <i class="fa fa-lg fa-question-circle form-tooltip-icon" data-toggle="tooltip" data-placement="top" title="<spring:message code="services.form.tooltip.name" />"></i>
                    </label>
                    <div class="col-sm-9">
                        <div class="input-group">
                            <div class="input-group-addon input-group-required" title="<spring:message code="services.form.required" />"><i class="fa fa-exclamation-triangle"></i></div>
                            <input type="text" class="form-control" id="serviceName" ng-model="serviceFormCtrl.formData.name">
                        </div>
                    </div>
                </div>

                <!-- Service Description -->
                <div class="form-group">
                    <label class="col-sm-3 required" for="serviceDesc">
                        <spring:message code="services.form.label.description" />
                        <i class="fa fa-lg fa-question-circle form-tooltip-icon" data-toggle="tooltip" data-placement="top" title="<spring:message code="services.form.tooltip.description" />"></i>
                        </label>
                    <div class="col-sm-9">
                        <div class="input-group">
                            <div class="input-group-addon input-group-required" title="<spring:message code="services.form.required" />"><i class="fa fa-exclamation-triangle"></i></div>
                            <textarea class="form-control" rows="5" id="serviceDesc" ng-model="serviceFormCtrl.formData.description"></textarea>
                        </div>
                    </div>
                </div>

                <!-- Service Type -->
                <div class="form-group">
                    <label class="col-sm-3 required" for="serviceType">
                        <spring:message code="services.form.label.type" />
                        <i class="fa fa-lg fa-question-circle form-tooltip-icon" data-toggle="tooltip" data-placement="top" title="<spring:message code="services.form.tooltip.type" />"></i>
                    </label>
                    <div class="col-sm-9">
                        <div class="input-group">
                            <div class="input-group-addon input-group-required" title="<spring:message code="services.form.required" />"><i class="fa fa-exclamation-triangle"></i></div>
                            <select class="form-control" id="serviceType" ng-model="serviceFormCtrl.formData.type">
                                <option ng-repeat="opt in serviceFormCtrl.selectOptions.serviceTypeList" value="{{ opt.value }}"
                                    ng-selected="serviceFormCtrl.isSelected(opt.value, serviceFormCtrl.formData.type)">{{ opt.name }}</option>
                            </select>
                        </div>
                    </div>
                </div>

                <!-- OAuth Options Only -->
                <div class="oauth-only-options-container" ng-show="serviceFormCtrl.formData.type=='oauth'">
                    <div class="panel panel-warning">
                        <div class="panel-heading">
                            <h3 class="panel-title">
                                <spring:message code="services.form.header.oauthOptions" />
                            </h3>
                        </div>
                            <div class="panel-body">
                                <!-- OAuth Client ID -->
                                <div class="form-group">
                                    <label class="col-sm-4" for="oauthClientId">
                                        <spring:message code="services.form.label.oauthClientId" />
                                        <i class="fa fa-lg fa-question-circle form-tooltip-icon" data-toggle="tooltip" data-placement="top" title="<spring:message code="services.form.tooltip.oauthClientId" />"></i>
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="oauthClientId" ng-model="serviceFormCtrl.formData.oauth.clientId" />
                                    </div>
                                </div>

                                <!-- OAuth Client Secret -->
                                <div class="form-group">
                                    <label class="col-sm-4" for="oauthClientSecret">
                                        <spring:message code="services.form.label.oauthClientSecret" />
                                        <i class="fa fa-lg fa-question-circle form-tooltip-icon" data-toggle="tooltip" data-placement="top" title="<spring:message code="services.form.tooltip.oauthClientSecret" />"></i>
                                    </label>
                                    <div class="col-sm-8">
                                        <input class="form-control" id="oauthClientSecret" type="text"
                                            ng-model="serviceFormCtrl.formData.oauth.clientSecret" ng-if="serviceFormCtrl.showOAuthSecret" />
                                        <input class="form-control" id="oauthClientSecret" type="password"
                                            ng-model="serviceFormCtrl.formData.oauth.clientSecret" ng-if="!serviceFormCtrl.showOAuthSecret" />
                                    </div>
                                </div>

                                <div class="col-md-8 col-md-offset-4">
                                    <!-- OAuth Show/Hide Client Secret -->
                                    <div class="checkbox">
                                        <label for="oauthShowSecret">
                                            <input type="checkbox" id="oauthShowSecret" ng-model="serviceFormCtrl.showOAuthSecret" />
                                            <spring:message code="services.form.label.oauthShowSecret" />
                                            <i class="fa fa-lg fa-question-circle form-tooltip-icon no-float" data-toggle="tooltip" data-placement="top" title="<spring:message code="services.form.tooltip.oauthShowSecret" />"></i>
                                        </label>
                                    </div>
                                    <!-- OAuth Bypass Approval Prompt -->
                                    <div class="checkbox">
                                        <label for="oauthBypass">
                                            <input type="checkbox" id="oauthBypass" ng-model="serviceFormCtrl.formData.oauthBypass" />
                                            <spring:message code="services.form.label.oauthBypass" />
                                            <i class="fa fa-lg fa-question-circle form-tooltip-icon no-float" data-toggle="tooltip" data-placement="top" title="<spring:message code="services.form.tooltip.oauthBypass" />"></i>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div><%-- end .oauth-only-options-container div --%>

                <div class="row">
                    <div class="col-sm-6">
                        <!-- Service Theme -->
                        <div class="form-group">
                            <label class="col-sm-6" for="serviceTheme">
                                <spring:message code="services.form.label.theme" /> <i class="fa fa-lg fa-question-circle form-tooltip-icon" data-toggle="tooltip" data-placement="top" title="<spring:message code="services.form.tooltip.theme" />"></i>
                            </label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="serviceTheme" ng-model="serviceFormCtrl.formData.theme" />
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <!-- Assigned ID -->
                        <div class="form-group">
                            <label class="col-sm-5" for="assignedId">
                                <spring:message code="services.form.label.assignedId" /> <i class="fa fa-lg fa-question-circle form-tooltip-icon" data-toggle="tooltip" data-placement="top" title="<spring:message code="services.form.tooltip.assignedId" />"></i>
                            </label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="assignedId" ng-model="serviceFormCtrl.formData.assignedId" readonly />
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Logo URL -->
                <div class="form-group">
                    <label class="col-sm-3" for="logoUrl">
                        <spring:message code="services.form.label.logoUrl" /> <i class="fa fa-lg fa-question-circle form-tooltip-icon" data-toggle="tooltip" data-placement="top" title="<spring:message code="services.form.tooltip.logoUrl" />"></i>
                    </label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="logoUrl" ng-model="serviceFormCtrl.formData.logoUrl">
                    </div>
                </div>

                <!-- Logout URL -->
                <div class="form-group">
                    <label class="col-sm-3" for="logoutUrl">
                        <spring:message code="services.form.label.logoutUrl" /> <i class="fa fa-lg fa-question-circle form-tooltip-icon" data-toggle="tooltip" data-placement="top" title="<spring:message code="services.form.tooltip.logoutUrl" />"></i>
                    </label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="logoutUrl" ng-model="serviceFormCtrl.formData.logoutUrl">
                    </div>
                </div>

                <div class="row">
                    <!-- Logout Type -->
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label class="col-sm-6" for="logoutType">
                                <spring:message code="services.form.label.logoutType" /> <i class="fa fa-lg fa-question-circle form-tooltip-icon" data-toggle="tooltip" data-placement="top" title="<spring:message code="services.form.tooltip.logoutType" />"></i>
                            </label>
                            <div class="col-sm-6">
                                <select class="form-control" id="logoutType" ng-model="serviceFormCtrl.formData.logoutType">
                                    <option ng-repeat="opt in serviceFormCtrl.selectOptions.logoutTypeList" value="{{ opt.value }}"
                                        ng-selected="serviceFormCtrl.isSelected(opt.value, serviceFormCtrl.formData.logoutType)">{{ opt.name }}</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <!-- Service Required Handlers -->
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label class="col-sm-5" for="reqHandler">
                                <spring:message code="services.form.label.requiredHandlers" /> <i class="fa fa-lg fa-question-circle form-tooltip-icon" data-toggle="tooltip" data-placement="top" title="<spring:message code="services.form.tooltip.requiredHandlers" />"></i>
                            </label>
                            <div class="col-sm-7">
                                <select multiple class="form-control" id="reqHandler" ng-model="serviceFormCtrl.formData.requiredHandlers">
                                    <option ng-repeat="opt in serviceFormCtrl.selectOptions.reqHandlerList" value="{{ opt.value }}"
                                        ng-selected="serviceFormCtrl.isSelected(opt.value, serviceFormCtrl.formData.requiredHandlers)">{{ opt.name }}</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Service Access Strategy -->
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <div class="panel-title"><spring:message code="services.form.header.sas" /></div>
                    </div>
                    <div class="panel-body panel-sas-options">
                        <div class="col-sm-12 form-group">
                            <div class="col-sm-6 checkbox">
                                <label class="col-sm-12" for="ssoEnabled">
                                    <input type="checkbox" id="ssoEnabled" ng-model="serviceFormCtrl.sas.ssoEnabled" />
                                    <spring:message code="services.form.label.sas.ssoEnabled" />
                                    <i class="fa fa-lg fa-question-circle form-tooltip-icon no-float" data-toggle="tooltip" data-placement="top"
                                        title="<spring:message code="services.form.tooltip.sas.ssoEnabled" />"></i>
                                </label>
                            </div>
                            <div class="col-sm-6 checkbox">
                                <label class="col-sm-12" for="sasRequireAll">
                                    <input type="checkbox" id="sasRequireAll" ng-model="serviceFormCtrl.sas.requireAll" />
                                    <spring:message code="services.form.label.sas.requireAll" />
                                    <i class="fa fa-lg fa-question-circle form-tooltip-icon no-float" data-toggle="tooltip" data-placement="top"
                                        title="<spring:message code="services.form.tooltip.sas.requireAll" />"></i>
                                </label>
                            </div>
                        </div>

                        <div class="col-sm-12">
                            <label for="sasRequiredAttr">
                                <spring:message code="services.form.label.sas.requiredAttr" />
                                <i class="fa fa-lg fa-question-circle form-tooltip-icon no-float" data-toggle="tooltip" data-placement="top"
                                    title="<spring:message code="services.form.tooltip.sas.requiredAttr" />"></i>
                            </label>
                            <div class="panel panel-default">
<%-- TODO: Make this work with the form. --%>
                                <table id="sasMapTable" class="table table-striped table-hover table-responsive table-condensed">
                                    <thead>
                                        <tr>
<%-- TODO: Change these table header labels. --%>
                                            <th class="col-md-6"><spring:message code="services.form.label.attrRelease.policies.sourceAttribute" /></th>
                                            <th class="col-md-6"><spring:message code="services.form.label.attrRelease.policies.casAttribute" /></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Attribute 1</td>
                                            <td><input class="form-control input-sm"></td>
                                        </tr>
                                        <tr>
                                            <td>Attribute 2</td>
                                            <td><input class="form-control input-sm"></td>
                                        </tr>
                                        <tr>
                                            <td>Attribute 3</td>
                                            <td><input class="form-control input-sm"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div><%-- end .panel.panel-default --%>
                        </div><%-- end .col-sm-8.form-group --%>
                    </div>
                </div><%-- end Service Access Strategy --%>
            </div>

            <div class="col-sm-6">
                <!-- Username Attribute Provider Options -->
                <div class="username-attribute-provider-container">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <h3 class="panel-title">
                                <spring:message code="services.form.header.usernameAttProvider" />
                            </h3>
                        </div><%-- end .panel-header div --%>
                        <div class="panel-body">
                            <div class="radio-group">
                                <!-- Username Attribute Provider Radio Button - Default -->
                                <label class="radio-inline">
                                    <input type="radio" name="uapRadio" id="uapDefault" value="default"
                                        ng-model="serviceFormCtrl.formData.userAttrProvider.type"
                                        ng-checked="serviceFormCtrl.formData.userAttrProvider.type === 'default'" />
                                    <spring:message code="services.form.label.uap.default" />
                                </label>
                                <!-- Username Attribute Provider Radio Button - Anonymous -->
                                <label class="radio-inline">
                                    <input type="radio" name="uapRadio" id="uapAnon" value="anon"
                                        ng-model="serviceFormCtrl.formData.userAttrProvider.type"
                                        ng-checked="serviceFormCtrl.formData.userAttrProvider.type === 'anon'" />
                                    <spring:message code="services.form.label.uap.anon" />
                                </label>
                                <!-- Username Attribute Provider Radio Button - Principle Attribute -->
                                <label class="radio-inline">
                                    <input type="radio" name="uapRadio" id="uapAtt" value="attr"
                                        ng-model="serviceFormCtrl.formData.userAttrProvider.type"
                                        ng-checked="serviceFormCtrl.formData.userAttrProvider.type === 'attr'" />
                                    <spring:message code="services.form.label.uap.principleAtt" />
                                </label>
                            </div><%-- end .radio-group div --%>

                            <!-- Username Attribute Provider Default Options -->
                            <div class="well well-sm" ng-show="serviceFormCtrl.formData.userAttrProvider.type === 'default'">
                                <spring:message code="management.services.service.noAction" />
                            </div>
                            <!-- Username Attribute Provider Anonymous Options -->
                            <div class="form-group" ng-show="serviceFormCtrl.formData.userAttrProvider.type === 'anon'">
                                <label class="col-sm-4 required" for="uapSaltSetting">
                                    <spring:message code="services.form.label.uap.saltSetting" /> <i class="fa fa-lg fa-question-circle form-tooltip-icon" data-toggle="tooltip" data-placement="top" title="<spring:message code="services.form.tooltip.uap.saltSetting" />"></i>
                                </label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <div class="input-group-addon input-group-required"><i class="fa fa-lg fa-exclamation-triangle"></i></div>
                                        <input type="text" class="form-control" id="uapSaltSetting" ng-model="serviceFormCtrl.formData.userAttrProvider.value">
                                    </div>
                                </div>
                            </div>
                            <!-- Username Attribute Provider Principle Attribute Options -->
                            <div class="form-group" ng-show="serviceFormCtrl.formData.userAttrProvider.type === 'attr'">
                                <label class="col-sm-4" for="uapUsernameAttribute">
                                    <spring:message code="services.form.label.uap.usernameAttribute" />
                                    <i class="fa fa-lg fa-question-circle form-tooltip-icon" data-toggle="tooltip" data-placement="top" title="<spring:message code="services.form.tooltip.uap.usernameAttribute" />"></i>
                                </label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="uapUsernameAttribute" ng-model="serviceFormCtrl.formData.userAttrProvider.value">
<!--                                
                                    <select class="form-control" id="uapUsernameAttribute" ng-model="serviceFormCtrl.formData.userAttrProvider.value">
<%-- TODO: Make this work. --%>
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                    </select>
-->
                                </div>
                            </div>
                        </div><%-- end .panel-body div --%>
                    </div><%-- end .panel div --%>
                </div><%-- end .username-attribute-provider-container div --%>

                <!-- Public Key Options -->
                <div class="public-key-container">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <h3 class="panel-title">
                                <spring:message code="services.form.header.pubKey" />
                            </h3>
                        </div> <!-- end .panel-header div -->
                        <div class="panel-body">

                            <!-- Public Key Location -->
                            <div class="form-group">
                                <label class="col-sm-4" for="publicKeyLocation">
                                    <spring:message code="services.form.label.pubKey.location" /> <i class="fa fa-lg fa-question-circle form-tooltip-icon" data-toggle="tooltip" data-placement="top" title="<spring:message code="services.form.tooltip.pubKey.location" />"></i>
                                </label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="publicKeyLocation" ng-model="serviceFormCtrl.formData.publicKey.location">
                                </div>
                            </div>
                            <!-- Public Key Algorithm -->
                            <div class="form-group">
                                <label class="col-sm-4" for="publicKeyAlgorithm">
                                    <spring:message code="services.form.label.pubKey.algorithm" /> <i class="fa fa-lg fa-question-circle form-tooltip-icon" data-toggle="tooltip" data-placement="top" title="<spring:message code="services.form.tooltip.pubKey.algorithm" />"></i>
                                </label>
                                <div class="col-sm-8">
                                    <select class="form-control" id="publicKeyAlgorithm" ng-model="serviceFormCtrl.formData.publicKey.algorithm" disabled>
                                        <option value="RSA" ng-selected="true">RSA</option>
                                    </select>
                                </div>
                            </div>
                        </div><%-- end .panel-body div --%>
                    </div><%-- end .panel div --%>
                </div><%-- end .pub-key-container div --%>

                <!-- Proxy Policy Options -->
                <div class="proxy-policy-container">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <h3 class="panel-title">
                                <spring:message code="services.form.header.proxyPolicy" />
                            </h3>
                        </div><%-- end .panel-header div --%>
                        <div class="panel-body">
                            <div class="radio-group">

                                <!-- Proxy Policy Radio Button - Refuse -->
                                <label class="radio-inline">
                                    <input type="radio" name="proxyPolicyRadio" id="proxyRefuse" value="refuse" ng-model="serviceFormCtrl.formData.proxyPolicy.type" ng-checked="true">
                                    <spring:message code="services.form.label.proxyPolicy.refuse" />
                                </label>

                                <!-- Proxy Policy Radio Button - Regex -->
                                <label class="radio-inline">
                                    <input type="radio" name="proxyPolicyRadio" id="proxyRegex" value="regex" ng-model="serviceFormCtrl.formData.proxyPolicy.type" >
                                    <spring:message code="services.form.label.proxyPolicy.regex" />
                                </label>
                            </div><%-- end .radio-group div --%>

                            <!-- Proxy Policy Refuse Options -->
                            <div class="well well-sm" ng-show="serviceFormCtrl.formData.proxyPolicy.type === 'refuse'">
                                <spring:message code="management.services.service.noAction" />
                            </div>

                            <!-- Proxy Policy Regex Options -->
                            <div class="form-group" ng-show="serviceFormCtrl.formData.proxyPolicy.type === 'regex'">
                                <label class="col-sm-3 required" for="proxyPolicyRegex">
                                    <spring:message code="services.form.label.proxyPolicy.regex" />
                                    <i class="fa fa-lg fa-question-circle form-tooltip-icon" data-toggle="tooltip" data-placement="top" title="<spring:message code="services.form.tooltip.proxyPolicy.regex" />"></i>
                                </label>
                                <div class="col-sm-9">
                                    <div class="input-group">
                                        <div class="input-group-addon input-group-required"><i class="fa fa-lg fa-exclamation-triangle"></i></div>
                                        <input type="text" class="form-control" id="proxyPolicyRegex" ng-model="serviceFormCtrl.formData.proxyPolicy.value">
                                        <div class="input-group-addon">(.*)</div>
                                    </div>
                                </div>
                            </div><%-- end .form-group div --%>
                        </div><%-- end .panel-body div --%>
                    </div><%-- end .panel div --%>
                </div><%-- end .proxy-policy-container div --%>

                <!-- Attribute Release Policy Options -->
                <div class="attribute-release-policy-container">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <h3 class="panel-title"><spring:message code="services.form.header.attrRelPolicy" /></h3>
                        </div>
                        <div class="panel-body">
                            <div class="checkbox-group">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" value="1"
                                            ng-model="serviceFormCtrl.formData.attrRelease.releasePassword"
                                            ng-checked="serviceFormCtrl.formData.attrRelease.releasePassword" />
                                        <spring:message code="services.form.label.attrRelease.releaseCredPassword" />
                                        <i class="fa fa-lg fa-question-circle form-tooltip-icon no-float" data-toggle="tooltip" data-placement="top" title="<spring:message code="services.form.tooltip.attrRelease.releaseCredPassword" />"></i>
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" value="1"
                                            ng-model="serviceFormCtrl.formData.attrRelease.releaseTicket"
                                            ng-checked="serviceFormCtrl.formData.attrRelease.releaseTicket" />
                                        <spring:message code="services.form.label.attrRelease.releaseProxyTicket" />
                                        <i class="fa fa-lg fa-question-circle form-tooltip-icon no-float" data-toggle="tooltip" data-placement="top" title="<spring:message code="services.form.tooltip.attrRelease.releaseProxyTicket" />"></i>
                                    </label>
                                </div>
                            </div><%-- end .checkbox-group div --%>

                            <!-- Attribute Filter -->
                            <div class="form-group">
                                <label class="col-sm-4" for="attFilter">
                                    <spring:message code="services.form.label.attrRelease.attrFilter" />
                                    <i class="fa fa-lg fa-question-circle form-tooltip-icon" data-toggle="tooltip" data-placement="top" title="<spring:message code="services.form.tooltip.attrRelease.attrFilter" />"></i>
                                </label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="attFilter" ng-model="serviceFormCtrl.formData.attrRelease.attrFilter">
                                        <div class="input-group-addon">(.*)</div>
                                    </div>
                                </div>
                            </div>

                            <!-- Principle Attribute Repository Options -->
                            <div class="panel panel-default">
                                <div class="panel-heading"><spring:message code="services.form.header.principleAttRepo" /></div>
                                <div class="panel-body">
                                    <div class="radio-group">
                                        <!-- Principle Repository Radio Button - Default -->
                                        <label class="radio-inline">
                                            <input type="radio" name="prinFilterDefault" id="prinFilterDefault" value="default"
                                                ng-model="serviceFormCtrl.formData.attrRelease.attrOption"
                                                ng-checked="serviceFormCtrl.formData.attrRelease.attrOption == 'default'" />
                                            <spring:message code="services.form.label.attrRelease.principleAttRepo.default" />
                                        </label>
                                        <!-- Principle Filter Radio Button - Cached -->
                                        <label class="radio-inline">
                                            <input type="radio" name="prinFilterCached" id="prinFilterCached" value="cached"
                                                ng-model="serviceFormCtrl.formData.attrRelease.attrOption"
                                                ng-checked="serviceFormCtrl.formData.attrRelease.attrOption == 'cached'" />
                                            <spring:message code="services.form.label.attrRelease.principleAttRepo.cached" />
                                        </label>
                                    </div><%-- end .radio-group div --%>

                                    <!-- Principle Attribute Repo Default Options -->
                                    <div class="well well-sm" ng-show="serviceFormCtrl.formData.attrRelease.attrOption == 'default'">
                                        <spring:message code="management.services.service.noAction" />
                                    </div>

                                    <!-- Principle Attribute Repo Cached Options -->
                                    <div class="principle-attribute-cached-container" ng-show="serviceFormCtrl.formData.attrRelease.attrOption == 'cached'">
                                        <!-- Principle Attribute Repo Cached Time -->
                                        <div class="form-group">
                                            <label class="col-sm-4" for="cachedTime">
                                                <spring:message code="services.form.label.attrRelease.principleAttRepo.cached.timeUnit" />
                                                <i class="fa fa-lg fa-question-circle form-tooltip-icon" data-toggle="tooltip" data-placement="top" title="<spring:message code="services.form.tooltip.attrRelease.principleAttRepo.cached.timeUnit" />"></i>
                                            </label>
                                            <div class="col-sm-8">
                                                <div class="input-group">
                                                    <select class="form-control" id="cachedTime" ng-model="serviceFormCtrl.formData.attrRelease.cachedTimeUnit">
                                                        <option ng-repeat="opt in serviceFormCtrl.selectOptions.timeUnitsList" value="{{ opt.value }}"
                                                            ng-selected="serviceFormCtrl.isSelected(opt.value, serviceFormCtrl.formData.attrRelease.cachedTimeUnit)">{{ opt.name }}</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Principle Attribute Repo Cached Expiration -->
                                        <div class="form-group">
                                            <label class="col-sm-4" for="cachedExp">
                                                <spring:message code="services.form.label.attrRelease.principleAttRepo.cached.expiration" />
                                                <i class="fa fa-lg fa-question-circle form-tooltip-icon" data-toggle="tooltip" data-placement="top" title="<spring:message code="services.form.tooltip.attrRelease.principleAttRepo.cached.expiration" />"></i>
                                            </label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="cachedExp" ng-model="serviceFormCtrl.formData.attrRelease.cachedExpiration" />
                                            </div>
                                        </div>

                                        <!-- Principle Attribute Repo Merging Strategy -->
                                        <div class="form-group">
                                            <label class="col-sm-4" for="mergeStrategy">
                                                <spring:message code="services.form.label.attrRelease.principleAttRepo.cached.mergeStrategy" />
                                                <i class="fa fa-lg fa-question-circle form-tooltip-icon" data-toggle="tooltip" data-placement="top" title="<spring:message code="services.form.tooltip.attrRelease.principleAttRepo.cached.mergeStrategy" />"></i>
                                            </label>
                                            <div class="col-sm-8">
                                                <div class="input-group">
                                                    <select class="form-control" id="mergeStrategy" ng-model="serviceFormCtrl.formData.attrRelease.mergeStrategy">
                                                        <option ng-repeat="opt in serviceFormCtrl.selectOptions.mergeStrategyList" value="{{ opt.value }}"
                                                            ng-selected="serviceFormCtrl.isSelected(opt.value, serviceFormCtrl.formData.attrRelease.mergeStrategy)">{{ opt.name }}</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Attribute Filter Policies Options -->
                            <div class="panel panel-default">
                                <div class="panel-heading"><spring:message code="services.form.header.attrPolicy" /></div>
                                <div class="panel-body">
                                    <div class="radio-group">

                                        <!-- Filter Policies Radio Button - Return All -->
                                        <label class="radio-inline">
                                            <input type="radio" name="policiesReturnAll" id="policiesRadio" value="all"
                                                ng-model="serviceFormCtrl.formData.attrRelease.attrPolicy.type"
                                                ng-checked="serviceFormCtrl.formData.attrRelease.attrPolicy.type == 'all'" />
                                            <spring:message code="services.form.label.attrRelease.policies.returnAll" />
                                        </label>

                                        <!-- Filter Policies Radio Button - Return Allowed -->
                                        <label class="radio-inline">
                                            <input type="radio" name="policiesReturnAllowed" id="policiesReturnAllowed" value="allowed"
                                                ng-model="serviceFormCtrl.formData.attrRelease.attrPolicy.type"
                                                ng-checked="serviceFormCtrl.formData.attrRelease.attrPolicy.type == 'allowed'" />
                                            <spring:message code="services.form.label.attrRelease.policies.returnAllowed" />
                                        </label>

                                        <!-- Filter Policies Radio Button - Return Allowed -->
                                        <label class="radio-inline">
                                            <input type="radio" name="policiesReturnMapped" id="policiesReturnMapped" value="mapped"
                                                ng-model="serviceFormCtrl.formData.attrRelease.attrPolicy.type"
                                                ng-checked="serviceFormCtrl.formData.attrRelease.attrPolicy.type == 'mapped'" />
                                            <spring:message code="services.form.label.attrRelease.policies.returnMapped" />
                                        </label>
                                    </div><%-- end .radio-group div --%>

                                    <!-- Attribute Release Policies Return All Option -->
                                    <div class="well well-sm" ng-show="serviceFormCtrl.formData.attrRelease.attrPolicy.type == 'all'">
                                        <spring:message code="management.services.service.noAction" />
                                    </div>

                                    <!-- Attribute Release Policies Return Allowed Option -->
                                    <div class="form-group" ng-show="serviceFormCtrl.formData.attrRelease.attrPolicy.type == 'allowed'">
                                        <label class="col-sm-3" for="returnAllowed">
                                            <spring:message code="services.form.label.attrRelease.policies.returnAllowed" />
                                            <i class="fa fa-lg fa-question-circle form-tooltip-icon" data-toggle="tooltip" data-placement="top" title="<spring:message code="services.form.tooltip.attrRelease.policies.returnAllowed" />"></i>
                                        </label>
                                        <div class="col-sm-9">
                                            <select multiple class="form-control" id="returnedAllowedMultiselect"
                                                ng-model="serviceFormCtrl.formData.attrRelease.attrPolicy.value"
                                                ng-options="">
<%-- TODO: Make this work. --%>
                                            </select>
                                        </div>
                                    </div>

                                    <!-- Attribute Release Policies Return Mapped Option -->
                                    <div class="panel panel-default" ng-show="serviceFormCtrl.formData.attrRelease.attrPolicy.type == 'mapped'">
                                        <table id="returnMapTable" class="table table-striped table-hover table-responsive table-condensed">
<%-- TODO: Make this work. --%>
                                            <thead>
                                                <tr>
                                                    <th class="col-md-4"><spring:message code="services.form.label.attrRelease.policies.sourceAttribute" /></th>
                                                    <th class="col-md-8">
                                                        <spring:message code="services.form.label.attrRelease.policies.casAttribute" />
                                                        <i class="fa fa-lg fa-question-circle form-tooltip-icon no-float" data-toggle="tooltip" data-placement="top" title="<spring:message code="services.form.tooltip.attrRelease.policies.returnMapped" />"></i>
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>Attribute 1</td>
                                                    <td><input class="form-control input-sm"></td>
                                                </tr>
                                                <tr>
                                                    <td>Attribute 2</td>
                                                    <td><input class="form-control input-sm"></td>
                                                </tr>
                                                <tr>
                                                    <td>Attribute 3</td>
                                                    <td><input class="form-control input-sm"></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><%-- end .attribute-release-policy-container div --%>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="form-group services-button-group">
                        <button href="javascript://" ng-click="serviceFormCtrl.saveForm()" class="btn btn-primary">
                            <i class="fa fa-floppy-o"></i>
                            <spring:message code="services.form.button.save" />
                        </button>
                        <a href="javascript://" ng-click="action.homepage()" class="btn btn-default">
                            <i class="fa fa-times"></i>
                            <spring:message code="services.form.button.cancel" />
                        </a>
                    </div><%-- end services-button-group div --%>
                </div>
            </div>
        </div><%-- end .row div --%>
    </form><%-- end #serviceForm form --%>
