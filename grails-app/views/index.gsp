<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Lecoincoin</title>
</head>
<body>
    <content tag="nav">
        <sec:ifAnyGranted roles="ROLE_ADMIN">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Utilisateurs<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="#"></a><g:link controller="user">Visualiser</g:link></li>
                    <li><a href="#"></a><g:link controller="user" class="create" action="create">Ajouter</g:link></li>
                </ul>
            </li>
        </sec:ifAnyGranted>
        <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MODERATOR">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Annonces<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="#"></a><g:link controller="saleAd">Visualiser</g:link></li>
                    <li><a href="#"></a><g:link controller="saleAd" class="create" action="create">Ajouter</g:link></li>
                </ul>
            </li>
        </sec:ifAnyGranted>
        <li>
            <sec:ifLoggedIn>
                <g:link controller="logout">Déconnexion</g:link>
            </sec:ifLoggedIn>
            <sec:ifNotLoggedIn>
                <g:link controller="login">Connexion</g:link>
            </sec:ifNotLoggedIn>
        </li>
        <sec:ifLoggedIn>
        <li>
            <a href="#" role="button">Profil<span class="caret"></span></a>
        </li>
        </sec:ifLoggedIn>
    </content>

    <div id="content" role="main">
        <section class="row colset-2-its">
            <h1>Interface de gestion de Lecoincoin</h1>

            <div class="svg" role="presentation">
                <asset:image src="gestion.jpg" class="grails-logo"/>
            </div>
            <sec:ifNotLoggedIn>
                <div class="row colset-2-its" id="controllers" role="navigation">
                    <h2>Connectez vous</h2>
                </div>
            </sec:ifNotLoggedIn>
</section>
</div>

</body>
</html>
