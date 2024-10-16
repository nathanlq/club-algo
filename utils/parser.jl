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

function ecrire_fichier(chemin_fichier::AbstractString, lignes::Vector{String})
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
