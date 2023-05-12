<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="includes/header.jsp"%>

<div class="col-lg-6 col-xxl-4 my-5 mx-auto">
        <div class="d-grid gap-2">
          <a href="" class="btn btn-primary" type="button">Add new player</a>
        </div>
      </div>

    <div class="list-flex">

      <%
      for (int i = 0; i < 10; i++) {
      %>
            <div class="card">
                <div class="greyborder margincard">
                    <h4>Nickname</h4>
                    <h5>Nickname</h5>
                </div>
                <div class="greyborder margincard">
                    <h5>Last Name</h5>
                    <h5>Last Name</h5>
                </div>
                <div class="greyborder margincard">
                    <h5>Favourite character</h5>
                    <h5>Favourite character</h5>
                </div>
                <div class="margincard">
                    <a href="" class="btn btn-primary rounded-pill px-3">See details</a>
                    <a href="" class="btn btn-danger rounded-pill px-3">Delete player</a>
                </div>
            </div>

      <%
      }
      %>
      </div>



<%@include file="includes/footer.jsp"%>
</html>
