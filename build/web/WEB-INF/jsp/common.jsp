<%-- 
    Document   : common
    Created on : 16-Aug-2025, 9:52:02 pm
    Author     : sahil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="tableHeaderClass" value="px-6 py-3 text-left text-sm font-semibold text-gray-700 border-b" />
<c:set var="tableCellClass" value="px-6 py-3 border-b text-gray-800" />
<c:set var="actionButtonClass" value="text-white px-3 py-1 rounded-md text-sm" />
<c:set var="inputClass" value="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-violet-500 focus:ring-violet-500 sm:text-sm" />
<c:set var="submitButtonClass" value="w-full bg-violet-600 hover:bg-violet-700 text-white font-semibold py-2 px-4 rounded-md transition" />
<c:set var="successAlertClass" value="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative mb-4" />
<c:set var="errorAlertClass" value="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative mb-4" />

<c:if test="${process eq 'LoadForm'}">
    <form method="post" onsubmit="return InsertAccountData()" class="space-y-4">
        <div>
            <label for="name" class="block text-sm font-medium text-gray-700">Name</label>
            <input type="text" name="name" id="name" class="${inputClass}"/>
        </div>
        <div>
            <label for="balance" class="block text-sm font-medium text-gray-700">Balance</label>
            <input type="number" name="balance" id="balance" class="${inputClass}"/>
        </div>
        <div class="pt-4">
            <button type="submit"  class="${submitButtonClass}" >Save Account</button>
        </div>
    </form>
</c:if>

<c:if test="${process eq 'showData'}">
    <div class="p-6 bg-gray-100 min-h-screen">
        <h2 class="text-2xl font-bold text-gray-800 mb-4" >
            Account Data
        </h2>
        <div class="overflow-x-auto">
            <table class="min-w-full border border-gray-300 bg-white rounded-lg shadow-md">
                <thead class="bg-gray-200">
                    <tr>
                        <th class="${tableHeaderClass}">ID</th>
                        <th class="${tableHeaderClass}">Name</th>
                        <th class="${tableHeaderClass}">Balance</th>
                        <th class="${tableHeaderClass} text-center">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="row" items="${data}">
                        <tr class="hover:bg-gray-100 transition">
                            <td class="${tableCellClass}">${row.id}</td>
                            <td class="${tableCellClass}">${row.name}</td>
                            <td class="${tableCellClass}">${row.balance}</td>
                            <td class="${tableCellClass} text-center">
                                <button onclick="LoadDataInFormForUpdate(${row.id})" class="bg-blue-500 hover:bg-blue-600 ${actionButtonClass} mr-2" >Update</button>
                                <button onclick="DeleteAccount(${row.id})" class="bg-red-500 hover:bg-red-600 ${actionButtonClass}" >Delete</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</c:if>

<c:if test="${not empty successToInsert}">
    <div class="p-4">
        <c:choose>
            <c:when test="${successToInsert gt 0 }">
                <div class="${successAlertClass}" role="alert">
                    <strong class="font-bold" >Success!</strong>
                    <span class="block sm:inline">
                        Account was added successfully.
                    </span>
                </div>
            </c:when>
            <c:otherwise>
                 <div class="${errorAlertClass}" role="alert">
                    <strong class="font-bold" >Error!</strong>
                    <span class="block sm:inline">
                        Failed to add the account Please try again.
                    </span>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</c:if>

<c:if test="${not empty successToDelete}">
     <div class="p-4">
        <c:choose>
            <c:when test="${successToDelete gt 0 }">
                <div class="${successAlertClass}" role="alert">
                    <strong class="font-bold" >Success!</strong>
                    <span class="block sm:inline">
                        Account Deleted Successfully.
                    </span>
                </div>
            </c:when>
            <c:otherwise>
                 <div class="${errorAlertClass}" role="alert">
                    <strong class="font-bold" >Error!</strong>
                    <span class="block sm:inline">
                        Failed to delete the account Please try again.
                    </span>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</c:if>

<c:if test="${not empty successToUpdate}">
     <div class="p-4">
        <c:choose>
            <c:when test="${successToUpdate gt 0 }">
                <div class="${successAlertClass}" role="alert">
                    <strong class="font-bold" >Success!</strong>
                    <span class="block sm:inline">
                        Account Updated Successfully.
                    </span>
                </div>
            </c:when>
            <c:otherwise>
                 <div class="${errorAlertClass}" role="alert">
                    <strong class="font-bold" >Error!</strong>
                    <span class="block sm:inline">
                        Failed to update the account Please try again.
                    </span>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</c:if>

<c:if test="${process eq 'LoadUpdateForm'}">
    <form method="post" onsubmit="return updateAccountData()" class="space-y-4">
        <!-- ID -->
        <div>
            <label for="id" class="block text-sm font-medium text-gray-700">ID</label>
            <input type="number" readonly name="id" id="id" value="${FormData.id}" class="${inputClass}" />
        </div>

        <!-- Name -->
        <div>
            <label for="name" class="block text-sm font-medium text-gray-700">Name</label>
            <input type="text" name="name" id="name" value="${FormData.name}" class="${inputClass}" />
        </div>

        <!-- Balance -->
        <div>
            <label for="balance" class="block text-sm font-medium text-gray-700">Balance</label>
            <input type="number" step="0.01" name="balance" id="balance" value="${FormData.balance}" class="${inputClass}" />
        </div>

        <!-- Submit -->
        <div class="pt-4">
            <button type="submit" class="${submitButtonClass}">
                Update Account
            </button>
        </div>
    </form>
</c:if>
