#categoryId (string) category ID
#categoryName (string) name of above (denormalized!)
#led (boolean)
#duration (int) seconds
#title (string) present only if led = true
#filename (string) location in public/meditations, present only if led = true
Triratna.Collections.Meditations = new Mongo.Collection('meditations');