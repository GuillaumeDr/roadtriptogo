class Task < ApplicationRecord
  belongs_to :todolist

  TODOLIST_ETE_VOITURE = ['guide de voyage', "documents d'identité (passeport, carte d'identité)", 'documents de réservation', 'carte bancaire', 'permis de conduire', 'carte grise', "vérifier l'état de la voiture (pression des pneus, niveau d'huile, liquide de freins...", 'lampe torche', 'carte routière', 'mots fléchés', 'lunettes de soleil', 'chapeau / casquette / bob', 'crème solaire', 'slip de bain', 'brumisateur', 'sandales / tongs', 'paréo']
  TODOLIST_ETE_AVION = ['guide de voyage', "documents d'identité (passeport, carte d'identité)", 'documents de réservation', 'carte bancaire', 'réserver le vol', 'se renseigner sur les visas / vaccins', "carte d'embarquement", 'masque / boules Quies', 'mots fléchés', 'lunettes de soleil', 'chapeau / casquette / bob', 'crème solaire', 'slip de bain', 'brumisateur', 'sandales / tongs', 'paréo']
  TODOLIST_ETE_TRAIN = ['guide de voyage', "documents d'identité (passeport, carte d'identité)", 'documents de réservation', 'carte bancaire', 'réserver le train', 'billet de train', 'mots fléchés', 'lunettes de soleil', 'chapeau / casquette / bob', 'crème solaire', 'slip de bain', 'brumisateur', 'sandales / tongs', 'paréo']

  TODOLIST_AUTOMNE_VOITURE = ['guide de voyage', "documents d'identité (passeport, carte d'identité)", 'documents de réservation', 'carte bancaire', 'permis de conduire', 'carte grise', "vérifier l'état de la voiture (pression des pneus, niveau d'huile, liquide de freins...", 'lampe torche', 'carte routière', 'mots fléchés', 'vêtements de pluie (imperméables, bottes...)', 'veste polaire', 'lunettes de soleil']
  TODOLIST_AUTOMNE_AVION = ['guide de voyage', "documents d'identité (passeport, carte d'identité)", 'documents de réservation', 'carte bancaire', 'réserver le vol', 'se renseigner sur les visas / vaccins', "carte d'embarquement", 'masque / boules Quies', 'mots fléchés', 'vêtements de pluie (imperméables, bottes...)', 'veste polaire', 'lunettes de soleil']
  TODOLIST_AUTOMNE_TRAIN = ['guide de voyage', "documents d'identité (passeport, carte d'identité)", 'documents de réservation', 'carte bancaire', 'réserver le train', 'billet de train', 'mots fléchés', 'vêtements de pluie (imperméables, bottes...)', 'veste polaire', 'lunettes de soleil']

  TODOLIST_HIVER_VOITURE = ['guide de voyage', "documents d'identité (passeport, carte d'identité)", 'documents de réservation', 'carte bancaire', 'permis de conduire', 'carte grise', "vérifier l'état de la voiture (pression des pneus, niveau d'huile, liquide de freins...", 'lampe torche', 'carte routière', 'mots fléchés', 'lunettes de soleil', 'veste polaire', 'bonnet / gants', 'chaussettes de ski', 'après-ski', 'chauffe-mains']
  TODOLIST_HIVER_AVION = ['guide de voyage', "documents d'identité (passeport, carte d'identité)", 'documents de réservation', 'carte bancaire', 'réserver le vol', 'se renseigner sur les visas / vaccins', "carte d'embarquement", 'masque / boules Quies', 'mots fléchés', 'lunettes de soleil', 'veste polaire', 'bonnet / gants', 'chaussettes de ski', 'après-ski', 'chauffe-mains']
  TODOLIST_HIVER_TRAIN = ['guide de voyage', "documents d'identité (passeport, carte d'identité)", 'documents de réservation', 'carte bancaire', 'réserver le train', 'billet de train', 'mots fléchés', 'lunettes de soleil', 'veste polaire', 'bonnet / gants', 'chaussettes de ski', 'après-ski', 'chauffe-mains']

  TODOLIST_PRINTEMPS_VOITURE = ['guide de voyage', "documents d'identité (passeport, carte d'identité)", 'documents de réservation', 'carte bancaire', 'permis de conduire', 'carte grise', "vérifier l'état de la voiture (pression des pneus, niveau d'huile, liquide de freins...", 'lampe torche', 'carte routière', 'mots fléchés', 'lunettes de soleil', 'vêtements de pluie (imperméables, bottes...)', 'veste polaire', 'lunettes de soleil', 'chapeau / casquette / bob', 'crème solaire', 'slip de bain']
  TODOLIST_PRINTEMPS_AVION = ['guide de voyage', "documents d'identité (passeport, carte d'identité)", 'documents de réservation', 'carte bancaire', 'réserver le vol', 'se renseigner sur les visas / vaccins', "carte d'embarquement", 'masque / boules Quies', 'mots fléchés', 'lunettes de soleil', 'vêtements de pluie (imperméables, bottes...)', 'veste polaire', 'lunettes de soleil', 'chapeau / casquette / bob', 'crème solaire', 'slip de bain']
  TODOLIST_PRINTEMPS_TRAIN = ['guide de voyage', "documents d'identité (passeport, carte d'identité)", 'documents de réservation', 'carte bancaire', 'réserver le train', 'billet de train', 'mots fléchés', 'lunettes de soleil', 'vêtements de pluie (imperméables, bottes...)', 'veste polaire', 'lunettes de soleil', 'chapeau / casquette / bob', 'crème solaire', 'slip de bain']



  #ETE = ['lunettes de soleil', 'chapeau / casquette / bob', 'crème solaire', 'slip de bain', 'brumisateur', 'sandales / tongs', 'paréo']
  #AUTOMNE = ['vêtements de pluie (imperméables, bottes...)', 'veste polaire', 'lunettes de soleil']
  #HIVER = ['lunettes de soleil', 'veste polaire', 'bonnet / gants', 'chaussettes de ski', 'après-ski', 'chauffe-mains']
  #PRINTEMPS = ['lunettes de soleil', 'vêtements de pluie (imperméables, bottes...)', 'veste polaire', 'lunettes de soleil', 'chapeau / casquette / bob', 'crème solaire', 'slip de bain']

  #VOITURE = ['permis de conduire', 'carte grise', "vérifier l'état de la voiture (pression des pneus, niveau d'huile, liquide de freins...", 'lampe torche', 'guide de voyage', 'carte routière']
  #AVION = ['réserver le vol', 'se renseigner sur les visas / vaccins', "carte d'embarquement", 'masque / boules Quies']
  #TRAIN = ['réserver le train', 'billet de train', 'mots fléchés']


end
