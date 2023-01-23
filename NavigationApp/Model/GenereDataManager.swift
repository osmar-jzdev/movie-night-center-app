//
//  GenereDataManager.swift
//  NavigationApp
//
//  Created by Osmar Juarez on 03/09/22.
//

import Foundation

class GenereDataManager {
    
    private var generes: [Genere] = []
    
    func fetch() {
        if let file = Bundle.main.url(forResource: "genres", withExtension: "json"){
            do{
                let data = try Data(contentsOf: file)
                let decodedGeneres = try JSONDecoder().decode([String].self, from: data)
                for genere in decodedGeneres{
                    generes.append(Genere(genere: genere))
                }
                print("generos: ", generes)
            }catch {
                print("[ERROR]: ", error)
            }
        }
    }
    
    func genereCount() -> Int {
        return generes.count
    }
    
    func genereAt(index: Int) -> Genere {
        return generes[index]
    }
    
    func genereValue(index: Int) -> String {
        return generes[index].genere
    }
}
