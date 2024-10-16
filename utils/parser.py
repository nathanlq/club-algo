import os


def lire_fichier(chemin_fichier):
    try:
        with open(chemin_fichier, 'r') as fichier:
            lignes = [ligne.rstrip('\n') for ligne in fichier.readlines()]
        return lignes
    except FileNotFoundError:
        print(f"Le fichier '{chemin_fichier}' n'existe pas.")
        return []


def ecrire_fichier(chemin_fichier, lignes):
    with open(chemin_fichier, 'w') as fichier:
        for ligne in lignes:
            fichier.write(ligne + '\n')


def lister_chemins_absolus_dossier(dossier):
    chemins_absolus = []
    for dossier_racine, _, fichiers in os.walk(dossier):
        for fichier in fichiers:
            chemin_absolu = os.path.abspath(
                os.path.join(dossier_racine, fichier))
            chemins_absolus.append(chemin_absolu)
    return chemins_absolus
