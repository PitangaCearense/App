//
//  MoodboardRepository.swift
//  App
//
//  Created by José João Silva Nunes Alves on 25/05/21.
//

import CoreData

class MoodboardRepository: Repository {
    let coreDataService: CoredataService<Moodboard> = CoredataService<Moodboard>()

    func create(name: String? = nil, data: [UUID] = [],
                favorite: Bool = false, moodboardDay: Bool = false) -> Moodboard? {
        let moodboard = coreDataService.create()

        moodboard?.identifier = UUID()
        moodboard?.name = name
        moodboard?.creationDate = Date()
        moodboard?.favorite = favorite
        moodboard?.moodboardDay = moodboardDay
        moodboard?.data = data
        
        _ = coreDataService.save()
        return moodboard
    }

    func readAll() -> [Moodboard] {
        return coreDataService.read()
    }

    func searchBy(ids: [UUID]) -> [Moodboard] {
        var results: [Moodboard] = [Moodboard]()
        var predicate: NSPredicate

        for identifier in ids {
            predicate = NSPredicate(format: "identifier == %@", identifier as CVarArg)
            if let moodboard = coreDataService.searchFor(predicate: predicate)?.first {
                results.append(moodboard)
            }
        }
        return results
    }

    func delete(identifier moodboards: [UUID]) {  // preciso aqui apagar todos os contents relacionados
        let listMoodboards = self.searchBy(ids: moodboards)

        for moodboard in listMoodboards {
            _ = coreDataService.delete(object: moodboard)
        }
    }

    func moodboardOfTheDay() -> Moodboard? {
        let predicate = NSPredicate(format: "moodboardDay == YES")
        guard let content = coreDataService.searchFor(predicate: predicate) else {return nil}

        return content.first
    }

    func getAllFavorites() -> [Moodboard]? {
        let predicate = NSPredicate(format: "favorite == YES")
        guard let content = coreDataService.searchFor(predicate: predicate) else {return nil}

        return content
    }

    func favoriteMoodboard(moodboard: Moodboard, name: String) -> Bool {
        moodboard.name = name
        moodboard.favorite = true
        return self.coreDataService.save()
    }

    func unfavoriteMoodboard(moodboard: Moodboard) -> Bool {
        moodboard.favorite = false
        if !moodboard.moodboardDay {
            self.delete(identifier: [moodboard.identifier!])
        }
        return self.coreDataService.save()
    }

    func refreshMoodboard(moodboard: Moodboard, newData: [UUID]) -> Moodboard? {
        if moodboard.favorite {
            guard let newMoodboard = self.create(name: nil, moodboardDay: true) else { return nil }

            moodboard.moodboardDay = false

            return newMoodboard
        }

        moodboard.data = newData
        return moodboard
    }
}
