<f:view>
   <sakai:view title="#{msgs['custom.chatroom']}">
      <h:form id="topForm">
      
      <script type="text/javascript">
	focus_path = [ "Control", "mainForm:message" ];
</script>
      
         <sakai:tool_bar>
            <h:commandLink action="toolOptions" rendered="#{ChatTool.canManageTool}">
               <h:outputText value="#{msgs.manage_tool}" />
            </h:commandLink>
            <h:commandLink action="toolOptions" rendered="#{ChatTool.siteChannelCount > 1}">
               <h:outputText value="#{msgs.change_room}" />
            </h:commandLink>
            <h:commandLink rendered="#{ChatTool.maintainer}"
                action="#{ChatTool.processActionPermissions}">
                <h:outputText
                    value="#{msgs.permis}" />
            </h:commandLink>
         </sakai:tool_bar>
            	
          <sakai:view_title value="#{ChatTool.viewingChatRoomText}"/>  	
            	
            	<h:outputText value="#{msgs.view}" />
	         <h:selectOneMenu id="viewOptions" value="#{ChatTool.viewOptions}" 
	         		onchange="this.form.submit();">
	            <f:selectItem itemValue="1" itemLabel="#{msgs.timeOnly}" />
	            <f:selectItem itemValue="3" itemLabel="#{msgs.timeAndDate}" />
	            <f:selectItem itemValue="2" itemLabel="#{msgs.dateOnly}" />
	            <f:selectItem itemValue="0" itemLabel="#{msgs.neitherDateOrTime}" />
	         </h:selectOneMenu>
	         <h:selectOneMenu id="messageOptions" value="#{ChatTool.messageOptions}"
	         		onchange="this.form.submit();">
	            <f:selectItem itemValue="-1" itemLabel="#{msgs.allMessages}" />
	            <f:selectItem itemValue="0" itemLabel="#{ChatTool.past3DaysText}" />
	         </h:selectOneMenu>
	     <div id="chatListWrapper" class="chatListWrapper">
				<div  class="chatListHeadWrapper">
					<h:outputText value="#{msgs.lay_note}" />
				</div>
				<sakai:messages />
				<div id="Monitor">
					<%@include file="roomMonitor.jspf" %>
				</div>
			</div>	
			<div id="chatPresenceWrapper">			
				<div class="chatListHeadWrapper">
					<h:outputText value="#{msgs.lay_user}" />
				</div>
				<div id="Presence">
					<%@include file="roomUsers.jspf" %>
				</div>
			</div>
			<iframe
					name="Control"
					id="Control"
					title="<h:outputText value="#{msgs.control_panel}" />"
					width="100%"
					height="120"
					frameborder="0"
					marginwidth="0"
					marginheight="0"
					scrolling="no"
					style="clear:both;display:block"
					src="roomControl">
				</iframe>
      </h:form>
<!--  We can't use the sakai:courier tag because it works from the tool placement id...  and this is now specific to presence in the room  -->
<script type="text/javascript" language="JavaScript">
updateTime = 10000;
updateUrl = "<h:outputText value="#{ChatTool.courierString}" />";
scheduleUpdate();
</script>
   </sakai:view>
</f:view>
