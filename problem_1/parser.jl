function lire_fichier(chemin_fichier::AbstractString)
    try
        lignes = String[]
        fichier = open(chemin_fichier, "r")
        for ligne in eachline(fichier)
            push!(lignes, chomp(ligne))
        end
        close(fichier)
        return lignes
    catch e
        if isa(e, IOError) && errno(e) == ENOENT
            println("Le fichier '$chemin_fichier' n'existe pas.")
            return String[]
        else
            rethrow()
        end
    end
end

function ecrire_fichier(chemin_fichier::AbstractString, lignes)
    fichier = open(chemin_fichier, "w")
    for ligne in lignes
        println(fichier, ligne)
    end
    close(fichier)
end

function lister_chemins_absolus_dossier(dossier::AbstractString)
    chemins_absolus = String[]
    for (dossier_racine, sous_dossiers, fichiers) in walkdir(dossier)
        for fichier in fichiers
            chemin_absolu = abspath(joinpath(dossier_racine, fichier))
            push!(chemins_absolus, chemin_absolu)
        end
    end
    return chemins_absolus
end

function play_match(match)
    if match == "PR" || match == "PP" || match == "RP"
        return "P"
    end
    if match == "RR" || match == "RS" || match == "SR"
        return "R"
    end
    if match == "SS" || match == "SP" || match == "PS"
        return "S"
    end
end

for file in lister_chemins_absolus_dossier("problem_1/level2")
    list_str = lire_fichier(file)
    res = []
    for tournament in list_str[2:end]
        match_list = [tournament[i:i+1] for i in 1:2:lastindex(tournament)]
        played_match = [play_match(match) for match in match_list]
        res_match = join(played_match)

        match_list2 = [res_match[i:i+1] for i in 1:2:lastindex(res_match)]
        played_match = [play_match(match) for match in match_list2]
        res_match = join(played_match)
        append!(res, [res_match])
    end
    println(res)
    ecrire_fichier("$file.out", res)
end