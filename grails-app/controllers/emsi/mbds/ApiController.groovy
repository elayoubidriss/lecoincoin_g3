package emsi.mbds

import grails.converters.JSON
import grails.converters.XML
import grails.plugin.springsecurity.annotation.Secured

class ApiController {
    /**
     * GET / PUT / PATCH / DELETE
     * Pour une note max : Gérer la notion de role en plus de l'utilisateur
     */
    @Secured('ROLE_ADMIN')
    def user() {
        switch (request.getMethod()) {
            case "GET":
                if (!params.id)
                    return response.status = 400
                def userInstance = User.get(params.id)
                if (!userInstance)
                    return response.status = 404
                response.withFormat {
                    xml { render userInstance as XML }
                    json { render userInstance as JSON }
                }
                break;

            case "PUT":
                // Mise à jour complète d'un user
                if (!params.id)
                    return response.status = 400
                def userInstance = User.get(params.id)

                def username = request.JSON.username
                userInstance.username = username

                def password = request.JSON.password

                if (password != "") {
                    userInstance.password = password
                }

                if (!userInstance)
                    return response.status = 404

                userInstance.save(flush: true)

                response.withFormat {
                    xml { render userInstance as XML }
                    json { render userInstance as JSON }
                }
                break;

            case "PATCH":
                // Mise à jour partielle d'un user
                if (!params.id)
                    return response.status = 400
                def userInstance = User.get(params.id)

                def username = request.JSON.username
                if (username != "") {
                    userInstance.username = username
                }

                def password = request.JSON.password
                if (password != "") {
                    userInstance.password = password
                }

                if (!userInstance)
                    return response.status = 404

                userInstance.save(flush: true)

                response.withFormat {
                    xml { render userInstance as XML }
                    json { render userInstance as JSON }
                }
                break;
            case "DELETE":
                // Supprimer un user
                if (!params.id)
                    return response.status = 400
                def userInstance = User.get(params.id)
                if (!userInstance)
                    return response.status = 404
                UserRole.removeAll(userInstance)
                userInstance.delete(flush: true)
                return response.status = 200
                break;
            default:
                return response.status = 405
                break;
        }
        return response.status = 406
    }

    /**
     * POST / GET
     */
    def users() {
        switch (request.getMethod()) {
            case "GET":
                def userList = User.getAll()
                if (userList.isEmpty())
                    return response.status = 404
                response.withFormat {
                    xml { render userList as XML }
                    json { render userList as JSON }
                }
                break;
            case "POST":
                def userInstance = new User(username: request.JSON.username, password: request.JSON.password)

                if (!userInstance.save(flush: true))
                    return response.status = 400

                UserRole.create(userInstance,Role.get(request.JSON.role), true)

                response.withFormat {
                    xml { render userInstance as XML }
                    json { render userInstance as JSON }
                }
                break;
            default:
                return response.status = 405
                break;
        }
        return response.status = 406
    }
    /**
     * GET / PUT / PATCH / DELETE
     */
    def annonce() {
        switch (request.getMethod()) {
            case "GET":
                if (!params.id)
                    return response.status = 400
                def adInstance = SaleAd.get(params.id)
                if (!adInstance)
                    return response.status = 404
                response.withFormat {
                    xml { render adInstance as XML }
                    json { render adInstance as JSON }
                }
                break;
            case "PUT":
                // Mise à jour complète d'une annonce
                if (!params.id)
                    return response.status = 400
                def adInstance = SaleAd.get(params.id)
                if (!adInstance)
                    return response.status = 404

                def title = request.JSON.title
                adInstance.title = title

                def description = request.JSON.description
                adInstance.description = description

                def ref = request.JSON.ref
                adInstance.ref = ref

                def price = request.JSON.price
                adInstance.price = price

                if (!adInstance)
                    return response.status = 404

                adInstance.save(flush: true)

                response.withFormat {
                    xml { render adInstance as XML }
                    json { render adInstance as JSON }
                }
                break;
            case "PATCH":
                // Mise à jour partielle d'une annonce
                if (!params.id)
                    return response.status = 400
                def adInstance = SaleAd.get(params.id)

                if (!adInstance)
                    return response.status = 404

                def title = request.JSON.title
                if (title != "") {
                    adInstance.title = title
                }

                def description = request.JSON.description
                if (description != "") {
                    adInstance.description = description
                }

                def ref = request.JSON.ref
                if (ref != "") {
                    adInstance.ref = ref
                }

                def price = request.JSON.price
                if (price != "") {
                    adInstance.price = price
                }

                if (!adInstance)
                    return response.status = 404

                adInstance.save(flush: true)

                response.withFormat {
                    xml { render adInstance as XML }
                    json { render adInstance as JSON }
                }
                break;
            case "DELETE":
                // Supprimer une annonce
                if (!params.id)
                    return response.status = 400
                def adInstance = SaleAd.get(params.id)
                if (!adInstance)
                    return response.status = 404
                def userInstance = adInstance.author
                userInstance.removeFromAds(adInstance)
                adInstance.delete(flush: true)
                return response.status = 200
                break;
            default:
                return response.status = 405
                break;
        }
        return response.status = 406
    }

    /**
     * POST / GET
     * Pour une note maximale : gérer la notion d'illustration
     */
    def annonces() {
        switch (request.getMethod()) {
            case "GET":
                def adList = SaleAd.getAll()
                if (adList.isEmpty())
                    return response.status = 404
                response.withFormat {
                    xml { render adList as XML }
                    json { render adList as JSON }
                }
                break;
            case "POST":
                def adInstance = new SaleAd(title: request.JSON.title, description: request.JSON.description, ref: request.JSON.ref, price: request.JSON.price)

                def userInstance = User.get(request.JSON.author)

                userInstance.addToAds(adInstance)

                if (!userInstance.save(flush: true))
                    return response.status = 400

                response.withFormat {
                    xml { render adInstance as XML }
                    json { render adInstance as JSON }
                }
                break;
            default:
                return response.status = 405
                break;
        }
        return response.status = 406
    }
}
