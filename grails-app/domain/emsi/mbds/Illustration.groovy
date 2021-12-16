package emsi.mbds

class Illustration {

    String filename

    static belongsTo = [ad: SaleAd]

    static constraints = {
        filename nullable: false, blank: false
    }
}
