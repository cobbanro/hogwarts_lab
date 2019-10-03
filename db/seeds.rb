require_relative('../models/student')
require_relative('../models/house')
require('pry')

house1 = House.new({'name' => 'Gryffindor', 'url' =>'https://www.partyrama.co.uk/wp-content/uploads/2017/10/1st-gryffindor-emblem-wall-cut-out-harry-potter-wizarding-world-gallery-view-image.jpg'})
house2 = House.new({'name' => 'Hufflepuff', 'url' =>'https://www.thestoreofrequirement.com.au/assets/full/2654.jpg?1522367195'})
house3 = House.new({'name' => 'Slytherin', 'url' => 'https://images-na.ssl-images-amazon.com/images/I/71uQOTCFq5L._SX425_.jpg'})
house4 = House.new({'name' => 'Ravenclaw', 'url' => 'https://cdn.shopify.com/s/files/1/0221/1146/products/Ravenclaw_Embroidered_Patch_Scaled_large.png?v=1553528845'})
house1.save()
house2.save()
house3.save()
house4.save()

#binding.pry

student_hash = {'first_name' => 'Harry', 'last_name' => 'Potter', 'age' => '12', 'house_id' => house1.id}
student1 = Student.new(student_hash)
student1.save()

student_hash2 = {'first_name' => 'Ron', 'last_name' => 'Weasely', 'age' => '13', 'house_id' => house2.id}
student2 = Student.new(student_hash2)
student2.save()
