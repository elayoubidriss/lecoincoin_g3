<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'saleAd.label', default: 'SaleAd')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<a href="#create-saleAd" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                               default="Skip to content&hellip;"/></a>

<div id="create-saleAd" class="content scaffold-create" role="main">
    <h1 style="font-weight: bold !important; margin-top: 2rem !important; padding-bottom: 2rem !important;">Ajouter Une Annonce</h1>

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.saleAd}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.saleAd}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <div class="container">

        <div class="row">
            <div class="col-md-4 order-md-2 mb-4">

            </div>

            <div class="col-md-4">
                <g:form class="form-signin" enctype="multipart/form-data" action="save" style="max-width:20rem !important;" resource="${this.saleAd}" method="POST">

                    <br>

                    <div class="form-label-group">
                        <label for="title">Titre</label>
                        <input type="text" name="title" value="" required="" id="title" class="form-control"
                               placeholder="Entrez un titre" autofocus="">
                    </div>
                    <br>

                    <div class="form-label-group">
                        <label for="description">Description</label>
                        <input type="text" name="description" value="" required="" id="description" class="form-control"
                               placeholder="Entrez une description">
                    </div>
                    <br>

                    <div class="form-label-group">
                        <label for="ref">Référence</label>
                        <textarea type="text" name="ref" value="" required="" id="ref"
                                  class="form-control"
                                  placeholder="Entrez une référence"></textarea>
                    </div>
                    <br>

                    <div class="form-label-group">
                        <label>Prix</label>
                        <input type="number" name="price" value="" required="" min="0.0" id="price"
                               class="form-control"
                               placeholder="Entrez un prix">
                    </div>
                    <br>

                    <div class="form-label-group">
                        <label for="filename0">Illustration</label>
                        <input type="file" name="filename0" value="" required="" id="filename0"
                               placeholder="Entrez un nom de fichier">

                        <div class="content" id="image_fields">
                            <br>
                        </div>
                        <br>
                        <input type="button" class=" btn  btn-warning"
                               id="more_fields" onclick="add_image_field();" value="Ajouter plus d'Illustrations"/>
                    </div>
                    <br>

                    <div class="form-label-group">
                        <label>Sélectionnez un Auteur</label>
                        <g:select class="form-control" from="${emsi.mbds.User.list()}"
                                  name="author" id='author' optionKey="id" optionValue="username"/>
                    </div>
                    <br>

                    <div class="form-label-group">
                        <g:submitButton class="btn btn-primary btn-warning btn-lg btn-block" name="create"
                                        value="${message(code: 'default.button.create.label', default: 'Create')}"/>
                    </div>

                </g:form>
                <br><br><br><br><br><br><br>
            </div>
        </div>
    </div>
</div>
<script>
    var i = 1;
    function add_image_field() {
        document.getElementById('image_fields').innerHTML += '<input type="file" name="filename' + i + '" value="" required="" id="filename"' + i + ' placeholder="Entrez un nom de fichier"> <br>\r\n';
        i++;
    }
</script>
</body>

</html>
