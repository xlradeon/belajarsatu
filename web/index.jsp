<%-- 
    Document   : index
    Created on : Apr 14, 2016, 10:45:16 PM
    Author     : edwin < edwinkun at gmail dot com >
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Halaman Login</title>
    </head>
    <body>
        <h1><CENTER><font color="green">Masukkan Username Dan Password Anda</font></CENTER></h1>
    <CENTER><table>
            <tr>
                <td>
                    Username
                </td>
                <td>
                    <input type="text" id="username" />
                </td>
            </tr>
            <tr>
                <td>
                    Password
                </td>
                <td>
                    <input type="password" id="password" />
                </td>
            </tr>
            <tr>
                <td>
                    Role
                </td>
                <td>
                    <input type="role" id="role" />
                </td>
            </tr>
            <tr>
                <td>
                    <button type="button" id="button-login"><font color="blue">Login</font></button>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <span id="error-message"></span>
                </td>
            </tr>
        </table></CENTER>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script>
            $('#button-login').click(function () {
                $.ajax({
                    type: "POST",
                    url: 'LoginServlet',
                    data: { username : $('#username').val(), password : $('#password').val(), role : $('#role').val() }
                })
                .done(function(data) {
                    $('#error-message').html(data.keterangan);
                    if(data.status === 1) {
                        // berhasil login
                        window.location = 'admin/hallo-admin.jsp';
                    } else {
                        // gagal login maka clear password field
                        $('#password').val('');
                    }
                });  
            });
        </script>
    </body>
</html>
