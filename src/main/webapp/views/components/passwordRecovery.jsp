<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container jsRecoveryComponent main-content">
    <div class="ui three column centered grid">
        <div class="column">
            <h2 class="ui center aligned icon header">
                <i class="circular unlock icon"></i>
                Password Recovery
            </h2>
            <div class="ui center aligned vertical segment">
                <p>
                    We will send you further instructions to the provided email address
                </p>
            </div>
            <div class="ui two column center aligned grid">
                <div class="column">
                    <form class="ui equal dividing width form jsPasswordRecoveryForm" method="post"
                          action="${pageContext.request.contextPath}/recovery">
                        <div class="field">
                            <input type="text" name="email" placeholder="Email">
                        </div>
                        <div class="ui error message"></div>
                        <button class="ui primary button jsSendToEmailBtn">
                            <div class="content">Send mail</div>
                        </button>
                    </form>
                    <c:set var="request" scope="session" value="${requestScope.answer}"/>
                    <c:choose>
                        <c:when test='${requestScope.answer == "SuccessSend"}'>
                            <div class="ui positive message jsMessageFromServlet">
                                <i class="close icon jsCloseMessageFromServlet"></i>
                                <div class="header">
                                    Success!
                                </div>
                                <p>Letter with instructions was sent in your email. Please check your post.</p>
                            </div>
                        </c:when>
                        <c:when test='${requestScope.answer == "ErrorSend"}'>
                            <div class="ui negative message jsMessageFromServlet">
                                <i class="close icon jsCloseMessageFromServlet"></i>
                                <div class="header">
                                    Error!
                                </div>
                                <p>Could not send message to email. Please try again later.</p>
                            </div>
                        </c:when>
                        <c:when test='${requestScope.answer == "ErrorEmailNotFound"}'>
                            <div class="ui warning message jsMessageFromServlet">
                                <i class="close icon jsCloseMessageFromServlet"></i>
                                <div class="header">
                                    Error!
                                </div>
                                <p>Email address not registered in the database.</p>
                            </div>
                        </c:when>
                        <c:when test='${requestScope.answer == "ErrorInputEmail"}'>
                            <div class="ui warning message jsMessageFromServlet">
                                <i class="close icon jsCloseMessageFromServlet"></i>
                                <div class="header">
                                    Error!
                                </div>
                                <p>Email address not registered in the database.</p>
                            </div>
                        </c:when>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
    <div class="ui page dimmer jsDimmerPasswordRecovery">
        <div class="content">
            <div class="ui text loader">Sending letter</div>
        </div>
    </div>
</div>
<%-- JS controller initilization --%>
<script type="text/javascript">
    window.frm.components.init('RecoveryComponent', '.jsRecoveryComponent');
</script>
