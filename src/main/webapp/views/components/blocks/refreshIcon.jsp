<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<a href="${pageContext.request.contextPath}/compare" class="circular ui icon button jsCompareButton">
    <i class="icon bar chart"></i>
    <c:if test="${sessionScope.compareListSize > 0}">
        <div class="floating ui circular teal label jsShoppingCartIcon">
                ${sessionScope.compareListSize}
        </div>
    </c:if>
</a>
<c:if test="${sessionScope.compareListSize > 0}">
    <i class="red large close link icon jsClearList"></i>
</c:if>