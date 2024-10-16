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

for file in lister_chemins_absolus_dossier("problem_1/level3")
    list_str = lire_fichier(file)
    res = []
    for tournament in list_str[2:end]
        tour = ""
        parsed = split(tournament)
        println(parsed)
        rock = parse(Int64, parsed[1][1:end-1])
        paper =  parse(Int64, parsed[2][1:end-1])
        scissor =  parse(Int64, parsed[3][1:end-1])
        while rock >= 3 
            tour *= "RRRP"
            rock -=3
            paper -= 1
        end
        if rock == 2 && paper ==1
            tour = tour * "RPR"
            rock -= 2
            paper -= 1
        end
        while rock >= 1
            tour *= "RP"
            rock -= 1
            paper -= 1
        end
        println(tour)
        println(paper)
        tour = tour * repeat("P", paper)
        tour = tour * repeat("S", scissor)
        println(tour)
        append!(res, [tour])
    end
    ecrire_fichier("$file.out", res)
end