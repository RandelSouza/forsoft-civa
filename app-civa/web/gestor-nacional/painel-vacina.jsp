<%@page import="model.GestorNacional"%>
<%@page import="dao.PaisDao"%>
<%@page import="dao.GestorNacionalDao"%>
<%@page import="dao.VacinaDao"%>
<%@page import="model.Vacina"%>
<%@page import="model.Pessoa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    // Transformando os dados que foram colocados na seção
    // em um objeto pessoa novamente

    Pessoa pessoa = (Pessoa) session.getAttribute("dados");

    // Verificando se o objeto pessoa não existe e se não é usuário
    if ((pessoa == null) || (!session.getAttribute("perfil").equals("gestor-nacional"))) {
        // Caso for uma das duas opções
        // Redirecionar para o login
        response.sendRedirect("../login/");

    }

    // Caso contrário é um usuário válido, pode entrar na página

%>


<%  
    try {
        Integer idVacina = Integer.parseInt(request.getParameter("idVacina"));
        Vacina vacina = VacinaDao.findById(idVacina);
        pageContext.setAttribute("vacina", vacina);
        
        GestorNacional gestorNacional = GestorNacionalDao.findByCodigociva(pessoa.getCodigoCiva(), pessoa.getCodigoCiva());        
        int idPais = PaisDao.getIdPaisByName(gestorNacional.getEndereco().getNomePais());
        
        pageContext.setAttribute("idPais", idPais);

    } catch (Exception e) {
    }
%>

<%@include file="header.jspf"%>
<script src="../public/assets/js/gestor-nacional/painel-vacina.js" defer></script>
</head>

<body class="hold-transition sidebar-mini">
    <div class="wrapper">

        <!-- Navbar --------------------------------------------->
        <%@include file="navbar.jspf" %>
        <!-- /.navbar ------------------------------------------------------->

        <!-- MENU Main Sidebar Container ------------------------------------>
        <%@include file="menu.jspf" %>

        <!-- Content Wrapper. Contains page content -------------------------->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0">Painel Vacina</h1>
                        </div>
                        <!-- /.col -->

                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="" id="go-back">Voltar</a></li>
                                <li class="breadcrumb-item active">Painel Vacina</li>
                            </ol>
                        </div>
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /.content-header ---------------------------------------------->

            <!-- Main content -->
            <div class="content">
                <div class="container-fluid">
                    <!---------------------------------------------------------------->

                    <section class="content-header">
                        <div class="container-fluid">

                            <div class="row">
                                <div class=" col-md-12">

                                    <div class="card card-primary">
                                        <div class="card-header">
                                            <h3 class="card-title">Dados Vacina</h3>
                                        </div>
                                        <!-- /.card-header -->
                                        <!-- form start -->
                                        <form id="form-cad-portador">
                                            <input type="hidden" value="desvincular" name="option">
                                             <input type="hidden" value="${idPais}" name="id-pais">
                                             <input type="hidden" value="${vacina.idVacina}" name="id-vacina">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="form-group col-6">
                                                        <label for="id-vacina">ID Vacina</label>
                                                        <input type="text" class="form-control" id="id-vacina" name="id-vacina" value="${vacina.idVacina}" disabled>
                                                    </div>
                                                    <div class="form-group col-6">
                                                        <label for="dose">Dose</label>
                                                        <input type="text" class="form-control" id="dose" name="dose" value="${vacina.numeroDoses}" disabled>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="form-group col-xl-6">
                                                        <label for="vacina">Vacina</label>
                                                        <input type="text" class="form-control" id="vacina" name="vacina" value="${vacina.nomeVacina}" disabled>
                                                    </div>
                                                    <div class="form-group col-xl-6">
                                                        <label for="laboratorio">Laborat&oacute;rio</label>
                                                        <input type="text" class="form-control" id="laboratorio" name="laboratorio" value="${vacina.laboratorio}" disabled>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="form-group col-xl-6">
                                                        <label for="tipo-vacina">Tipo de Vacina</label>
                                                        <input type="text" class="form-control" id="tipo-vacina" name="tipo-vacina" value="${vacina.tipoVacina}" disabled>
                                                    </div>
                                                    <div class="form-group col-xl-6">
                                                        <label for="tempo-doses">Tempo Entre Doses (em dias)</label>
                                                        <input type="text" class="form-control" id="tempo-doses" name="tempo-doses" value="${vacina.tempoEntreDoses}" disabled>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="form-group col-xl-12">
                                                        <label for="reforco">Tempo Para Refor&ccedil;o (em dias)</label>
                                                        <input type="text" class="form-control" id="reforco" name="reforco" value="${vacina.tempoReforco}" disabled>
                                                    </div>                                                   
                                                </div>

                                            </div>
                                        </form>

                                    </div>
                                </div>

                                <div class="col-md-12 mb-3 mt-3">
                                    <button type="button" class="btn btn-primary btn-lg" id="desvincular">Desvincular</button>
                                </div>

                            </div>

                        </div>
                        <!-- /.container-fluid -->
                    </section>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
                <div class="modal fade" id="modal-default" style="display: none;" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Vacina desvinculada com sucesso!</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">Ã</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <p></p>
                            </div>
                            <div class="modal-footer justify-content-between">
                                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.href = './gerenciar-vacina.jsp'">Close</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                </div>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->

        </div>
        <!-- Main Footer -->
        <%@include file="footer.jspf"%>

        <!-- ./wrapper -->
    </div>

</body>
</html>
