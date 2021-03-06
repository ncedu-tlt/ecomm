<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
    Used components:
    - categories
    - search
    - profileIcon
    - shoppingCartIcon
--%>


<div class="ui menu jsTopPanel">
    <div class="ui container">
        <a class="header item" href="${pageContext.request.contextPath}/home">Shop</a>
        <c:import url="../components/categories.jsp"/>
        <div class="ui item right">
            <c:import url="../components/search.jsp"/>
            <c:import url="../components/profileIcon.jsp"/>
            <c:import url="../components/productComparatorIcon.jsp"/>
            <c:import url="../components/shoppingCartIcon.jsp"/>
            <c:import url="../components/managementIcon.jsp"/>
            <c:import url="../components/logoutIcon.jsp"/>
        </div>
    </div>
</div>
<script type="text/javascript">
    window.frm.components.init('topPanelComponent', '.jsTopPanel', {
        addToCompareUrl: '${requestScope.addToCartURL}'
    });
</script>
