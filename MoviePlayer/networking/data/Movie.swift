//
//  Movie.swift
//  MoviePlayer
//
//  Created by Karin Prater on 04.08.21.
//

import Foundation

struct Movie: Identifiable, Codable {
    
    let id: String
    private let snippet: Snippet
    
    var title: String {
        snippet.title
    }
    var description: String {
        snippet.description
    }
    var posterImageURL: String {
        if let maxres = snippet.thumbnails.maxres {
            return maxres.url
        }else if let high = snippet.thumbnails.high {
            return high.url
        }else {
            return snippet.thumbnails.thumbnailsDefault.url
        }
    }
    
    let numberOfPeopleWatching: Int = 2021
    let categories: String = "Action, Science Fiction"
    var rating: Double = Double.random(in: 2...5)
    
    public enum CodingKeys: String, CodingKey {
        case id
        case snippet
    }
    
    //MARK: - helper for Swiftui Preview
    static func example1() -> Movie {
        let snippet = Snippet(channelID: "abcs", title: "Venom", description: "Die Entwicklungsgeschichte von Marvels geheimnisvollster, komplexester und krassester Figur – Venom! Als Journalist versucht Eddie (Tom Hardy) schon seit Langem den zwielichtigen, aber genialen Gründer der Life Foundation, Carlton Drake (Riz Ahmed), zu überführen – eine Besessenheit, die ihn bereits seine Karriere und die Beziehung zu seiner Freundin Anne Weying (Michelle Williams) gekostet hat. Bei der aktuellen Recherche zu Drakes Experimenten verbindet sich das Alien Venom mit Eddies Körper und verleiht ihm nicht nur erstaunliche Superkräfte, sondern auch die Freiheit, zu tun, was immer er will. Durchtrieben, düster, unberechenbar und voller Zorn: Eddie muss lernen, die gefährlichen Kräfte, die von Venom ausgehen, zu kontrollieren. Und ist gleichzeitig berauscht von der neu gewonnen Macht, die er nun in sich spürt.", thumbnails: Thumbnails(url: "https://i.ytimg.com/vi/9DnN_g24Odg/hqdefault.jpg"))
        
        return Movie(id: UUID().uuidString, snippet: snippet)
    }
    
    
    static func example2() -> Movie {
        let snippet = Snippet(channelID: "abcs",
                              title: "Planet der Affen: Prevolution",
                              description: " Will Rodman (James Franco) ist ein junger, engagierter Wissenschaftler, der zusammen mit seinem Vater (John Lithgow), ebenfalls ein Forscher, Heilmittel für Menschen erforscht. Ein vielversprechendes Mittel, in das Will viele Hoffnungen setzt, testet er in einem hoch-modernen Labor an Affen. Ein besonderer Affe namens Caesar (Andy Serkis) wächst ihm dabei ans Herz. Das Mittel scheint zu funktionieren. Doch plötzlich ruft es noch ganz andere, unerwartete Reaktionen hervor... Die Primatenforscherin Caroline (Freida Pinto) unterstützt Will auf der Suche nach den Ursachen - und den Folgen!\n  PLANET DER AFFEN: PREVOLUTION ist ein Prequel der beliebten Planet der Affen-Franchise, das modernste Special Effects des prämierten WETA Studios ('Avatar', 'Herr Der Ringe') enthält.",
                              thumbnails: Thumbnails(url:  "https://i.ytimg.com/vi/6ZfuNTqbHE8/maxresdefault.jpg"))
        
        
        return Movie(id: UUID().uuidString, snippet: snippet)
    }
    
    static func example3() -> Movie {
        let snippet = Snippet(channelID: "abcs",
                              title: "Planet der Affen: Prevolution - the best movie to watch",
                              description: " Will Rodman (James Franco) ist ein junger, engagierter Wissenschaftler, der zusammen mit seinem Vater (John Lithgow).",
                              thumbnails: Thumbnails(url:  "https://i.ytimg.com/vi/6ZfuNTqbHE8/maxresdefault.jpg"))
        
        
        return Movie(id: UUID().uuidString, snippet: snippet)
    }
}


extension Movie:  Comparable, Hashable {
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        lhs.id == rhs.id
    }
    
    static func < (lhs: Movie, rhs: Movie) -> Bool {
        lhs.title < rhs.title
    }
}
