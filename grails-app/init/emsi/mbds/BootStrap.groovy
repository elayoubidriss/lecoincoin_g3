package emsi.mbds

class BootStrap {

    def init = { servletContext ->

        def adminRole = new Role(authority: 'ROLE_ADMIN').save()
        def modRole = new Role(authority: 'ROLE_MODERATOR').save()
        def clientRole = new Role(authority: 'ROLE_CLIENT').save()

        def adminUser = new User(username: 'admin', password: 'admin').save()
        def modUser = new User(username: 'mod', password: 'mod').save()
        def clientUser = new User(username: 'client', password: 'client').save()

        UserRole.create(adminUser, adminRole, true)
        UserRole.create(modUser, modRole, true)
        UserRole.create(clientUser, clientRole, true)

        ["Alice", "Bob", "Charly", "Denis", "Etienne"].each {
            String usernameVar ->
                def userInstance = new User(username: usernameVar, password: 'password').save()
                (1..5).each {
                    Integer adIdx ->
                        def adInstance = new SaleAd(
                                title: "Title $usernameVar $adIdx",
                                description: "Description $usernameVar $adIdx",
                                price: adIdx*100,
                                status: Boolean.TRUE,
                                ref: "#$usernameVar:$adIdx"
                        )
                        (1..2).each {
                            adInstance.addToIllustrations(new Illustration(filename: "grails.svg"))
                        }
                        userInstance.addToAds(adInstance)
                }
                userInstance.save()
        }
    }
    def destroy = {
    }
}
