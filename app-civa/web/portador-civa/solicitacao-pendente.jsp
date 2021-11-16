<%@page import="model.Pessoa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Transformando os dados que foram colocados na seção
    // em um objeto pessoa novamente
    Pessoa pessoa = (Pessoa) session.getAttribute("dados");

    // Verificando se o objeto pessoa não existe e se não é usuário
    if ((pessoa == null) || (!session.getAttribute("perfil").equals("usuario"))) {
        // Caso for uma das duas opções
        // Redirecionar para o login
        response.sendRedirect("../login/");

    }

    // Caso contrário é um usuário válido, pode entrar na página

%>
<%@include file="header.jspf"%>
</head>

<body class="hold-transition sidebar-mini">
    <div class="wrapper">

        <!-- Navbar --------------------------------------------->
        <%@include file="navbar.jspf" %>
        <!-- /.navbar ------------------------------------------------------->

        <!-- MENU Main Sidebar Container ------------------------------------>
        <%@include file="menu.jspf" %>
        <!-- /.menu ------------------------------------------------------->

        <!-- Content Wrapper. Contains page content -------------------------->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0">Solicita&ccedil;&otilde;es pendentes</h1>
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /.content-header ---------------------------------------------->

            <!-- Main content -->
            <div class="container-fluid">
                <!---------------------------------------------------------------->
                <section class="content-header">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-12 col-md-6 w-100">
                                <div class="card">
                                    <div class="card-header">
                                        Status: <b>Pendente</b>
                                    </div>
                                    <div class="card-body" style="margin-bottom: -40px;">
                                        <div class="overflow-auto" style="height: 150px;">
                                            <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt voluptatem rerum dolorum impedit officiis quae, reiciendis asperiores nam quaerat aliquid velit iste ea ullam assumenda voluptates, molestias dolores
                                                accusamus quisquam!
                                            </p>
                                        </div>

                                        <p class="mt-2">Data solicita&ccedil;&aacute;o: 01/01/2021 </p>
                                    </div>
                                    <hr>
                                    <div class="d-flex justify-content-between align-items-center mx-3 mb-3">
                                        <button class="btn btn-outline-danger" data-toggle="modal"
                                                data-target="#modal-default">Cancelar solicita&ccedil;&atilde;o</button>

                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6 w-100">
                                <div class="card">
                                    <div class="card-header">
                                        Status: <b>Pendente</b>
                                    </div>
                                    <div class="card-body" style="margin-bottom: -40px;">
                                        <div class="overflow-auto" style="height: 150px;">
                                            <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt voluptatem rerum dolorum impedit officiis quae, reiciendis asperiores nam quaerat aliquid velit iste ea ullam assumenda voluptates, molestias dolores
                                                accusamus quisquam!
                                            </p>
                                        </div>

                                        <p class="mt-2">Data solicita&ccedil;&atilde;o: 01/01/2021 </p>
                                    </div>
                                    <hr>
                                    <div class="d-flex justify-content-between align-items-center mx-3 mb-3">
                                        <button class="btn btn-outline-danger" data-toggle="modal"
                                                data-target="#modal-default">Cancelar solicita&ccedil;&atilde;o</button>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.container-fluid -->
                </section>
                <!-- /.card-footer-->
            </div>

        </div>
        <!-------------- footer ------------------->
        <%@include file="footer.jspf" %>
        <!--------------- /.footer --------------->
        <%@include file="modal-certeza.jspf" %>
    </div>

    <!-- /.content -->
    <!-- /.content-wrapper -->

    <!-- ./wrapper -->

</body>

</html>