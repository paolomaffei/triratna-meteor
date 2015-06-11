c = Triratna.Collections.Categories

if c.find().count() == 0
  c.insert {
    _id: "body-scan"
    name: "Body Scan"
  }

  c.insert {
    _id: "mindfulness-of-breathing"
    name: "Mindfulness of Breathing"
  }

  c.insert {
    _id: "metta-bhavana"
    name: "Metta Bhavana"
  }

m = Triratna.Collections.Meditations

if m.find().count() == 0
  m.insert {
    _id: "body-scan-led-300"
    categoryId: "body-scan"
    categoryName: c.findOne({_id: "body-scan"}).name
    led: true
    duration: 300
    title: "Short body scan by LokaLoka"
  }
  
  m.insert {
    _id: "body-scan-led-600"
    categoryId: "body-scan"
    categoryName: c.findOne({_id: "body-scan"}).name
    led: true
    duration: 600
    title: "Medium length body scan by MettaMetta"
  }
  
  m.insert {
    _id: "body-scan-led-1978"
    categoryId: "body-scan"
    categoryName: c.findOne({_id: "body-scan"}).name
    led: true
    duration: 1978
    title: "Long body scan by Vidyamala"
    filename: "02 Lead Through of Body Scan.mp3"
    streamingUrl: "http://www.freebuddhistaudio.com/talks/mp3/LOC78%20Body%20Scan%20Meditation/02%20Lead%20Through%20of%20Body%20Scan.mp3"
  }
  
  m.insert {
    _id: "mindfulness-unled-300"
    categoryId: "mindfulness-of-breathing"
    categoryName: c.findOne({_id: "mindfulness-of-breathing"}).name
    led: false
    duration: 300
  }
  
  m.insert {
    _id: "mindfulness-unled-600"
    categoryId: "mindfulness-of-breathing"
    categoryName: c.findOne({_id: "mindfulness-of-breathing"}).name
    led: false
    duration: 600
  }

  m.insert {
    _id: "metta-led-600"
    categoryId: "metta-bhavana"
    categoryName: c.findOne({_id: "metta-bhavana"}).name
    led: true
    duration: 600
    title: "Metta Bhavana of Mighty Compassion"
  }
  
  m.insert {
    _id: "metta-led-1200"
    categoryId: "metta-bhavana"
    categoryName: c.findOne({_id: "metta-bhavana"}).name
    led: true
    duration: 1200
    title: "Metta Bhavana by VajraVajra"
  }
  
  m.insert {
    _id: "metta-unled-900"
    categoryId: "metta-bhavana"
    categoryName: c.findOne({_id: "metta-bhavana"}).name
    led: false
    duration: 900
  }