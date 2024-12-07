
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        height: 100vh;
    }

    .content {
        display: flex;
        justify-content: center;
        align-items: center;
        flex: 1;
        padding: 20px;
    }

    .form-container {
        background-color: #fff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        text-align: center;
        width: 400px;
    }

    .form-container h2 {
        margin-bottom: 20px;
        color: #333;
        font-size: 24px;
        text-transform: uppercase;
    }

    form table {
        width: 100%;
        border-collapse: collapse;
    }

    form table td {
        padding: 10px 0;
    }

    form label {
        font-weight: bold;
        color: #555;
    }

    form input[type="text"],
    form input[type="int"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
        margin-top: 5px;
        font-size: 16px;
    }

    form input[type="submit"] {
        width: 100%;
        padding: 10px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        font-weight: bold;
        transition: background-color 0.3s;
    }

    form input[type="submit"]:hover {
        background-color: #0056b3;
    }

    .button-container {
        text-align: center;
        padding-top: 15px;
    }

    .button-container h4 {
        margin-top: 15px;
        font-size: 14px;
    }

    footer {
        background-color: #333;
        color: #fff;
        text-align: center;
        padding: 10px 0;
        font-size: 14px;
    }
</style>

<body>
<div class="content">
   <div class="form-container">
   <h2>
     TYPE OTP
   </h2>
    <form action="pverify" method="post" >
        <table>

           <tr>
                <td><label for="semail">Enter Email Again</label></td>
                <td><input type="text" id="semail" name="semail" required/></td>
            </tr>
            <tr>
                <td><label for="potp">Enter OTP</label></td>
                <td><input type="int" id="potp" name="potp" required/></td>
            </tr>
            
           
            <tr>
                <td colspan="2" class="button-container">
                    <input type="submit" value="Verify"/>
                    <h4 align="center" style="color:red"><c:out value="${message}"></c:out></h4>
                </td>
            </tr>
        </table>
    </form>
</div>

</div>

<!-- Footer -->
<footer>
    <p>&copy; 2024 ERP System. All rights reserved.</p>
</footer>



</body> 