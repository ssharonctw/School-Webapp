<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- formatting tag library -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!-- changing the locale based on parameter input being passed in -->
<!-- if param is not empty, then use the param.theLocale (scope = session), else use the locale that's passed in via pageContext.request -->
<c:set var="theLocale" 
value="${not empty param.theLocale ? param.theLocale : pageContext.request.locale}"
scope="session" />

<!-- setting locale based on the param -->
<fmt:setLocale value="${theLocale}" />

<!-- set reference to the bundles by telling which bundle base name to use -->
<!-- JSP will append locale bundlebasename_<theLocale>.properties for you -->
<fmt:setBundle basename="com.luv2code.jsp.tagdemo.i18n.resources.mylabels" />

<html>

<body>
<!-- links to update JSP page to change locale based on user selection -->
<a href="i18n-messages-test.jsp?theLocale=en_US">English (US)</a>
 |
<a href="i18n-messages-test.jsp?theLocale=es_ES">Spanish (ES)</a>
 |
<a href="i18n-messages-test.jsp?theLocale=de_DE">German (DE)</a>
 
<hr>

<!-- Step2. using key=label.field to reference labels from our resource file-->
<fmt:message key="label.greeting" /> <br/> <br/>

<fmt:message key="label.firstname" /> <i>John</i> <br/>

<fmt:message key="label.lastname" /> <i>Doe</i> <br/><br/>

<fmt:message key="label.welcome" /> <br/>

<hr>

Selected locale: ${theLocale}

</body>

</html>




