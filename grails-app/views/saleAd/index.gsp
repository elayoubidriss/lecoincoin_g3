<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'saleAd.label', default: 'SaleAd')}" />
        <title>Liste des annonces</title>
    </head>
    <body>
        <a href="#list-saleAd" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}">Accueil</a></li>
                <li><g:link class="create" action="create">Nouvelle Annonce</g:link></li>
            </ul>
        </div>
        <div id="list-saleAd" class="content scaffold-list" role="main">
            <h1>Liste des annonces</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table class="property-list saleAd">
                <thead>
                <tr>
                    <th class="sortable"><a href="/saleAd/index?sort=title&amp;max=10&amp;order=asc">Titre</a></th>
                    <th class="sortable"><a href="/saleAd/index?sort=price&amp;max=10&amp;order=asc">Prix</a></th>
                    <th id="details-label" class="property-label">Détails</th>
                    <th id="modifier-label" class="property-label">Modifier</th>
                    <th id="supprimer-label" class="property-label">Supprimer</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${saleAdList}" var="bean" status="i">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td><f:display bean="${bean}" property="title" displayStyle="${displayStyle?:'table'}" /></td>
                        <td><f:display bean="${bean}" property="price" displayStyle="${displayStyle?:'table'}" /></td>
                        <td><g:link resource="${bean}" action="show">Détail</g:link></td>
                        <td><g:link resource="${bean}" action="edit">Modifier</g:link></td>
                        <td><g:link resource="${bean}" action="delete">Supprimer</g:link></td>
                    </tr>
                </g:each>
                </tbody>
            </table>

            <div class="pagination">
                <g:paginate total="${saleAdCount ?: 0}" />
            </div>
        </div>
    </body>
</html>
