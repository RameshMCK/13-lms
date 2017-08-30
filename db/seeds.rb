DatabaseCleaner.clean_with(:truncation)

User.create!(email: 'bob@aol.com', password: 'abc123')
User.create!(email: 'don@aol.com', password: 'abc123', role: 'teacher')
User.create(email: 'ram@aol.com', password: 'abc123', role: 'teacher')


Course.create!(name: 'Chemistry 3', subject: 'Science', level: 303, credits: 5)
Course.create!(name: 'Physics 2', subject: 'Science', level: 201, credits: 5)
Course.create!(name: 'Functional Programming', subject: 'Engineering', level: 420, credits: 5)
Course.create!(name: 'OOP', subject: 'Engineering', level: 225, credits: 5)
Course.create!(name: 'English', subject: 'Humanities', level: 101, credits: 3)
Course.create!(name: 'History', subject: 'Humanities', level: 102, credits: 2)

Registration.create!(course_id: 1, teacher_id: 2, semester: 'Fall', year: 2017, capacity: 100, is_open: true)
Registration.create!(course_id: 3, teacher_id: 2, semester: 'Spring', year: 2018, capacity: 50)
Registration.create!(course_id: 5, teacher_id: 2, semester: 'Fall', year: 2018, capacity: 75)



Section.create!(course_id: 2, title: Faker::ElderScrolls.dragon, content: Faker::Lorem.sentences(25).join(' '), azure: 'https://railsclass.blob.core.windows.net/classuploads/3031abdd364639a439ab10c591378275929ddae09e1c2eedb56cfb94a6f04eb136b7f1d36fd421a6cca3c67821e6a661894079af3333ff6aca0ce62bbcea856d/cat.jpg', link: Faker::Placeholdit.image, position: 0)
Section.create!(course_id: 2, title: Faker::ElderScrolls.dragon, content: Faker::Lorem.sentences(25).join(' '), azure: 'https://railsclass.blob.core.windows.net/classuploads/3031abdd364639a439ab10c591378275929ddae09e1c2eedb56cfb94a6f04eb136b7f1d36fd421a6cca3c67821e6a661894079af3333ff6aca0ce62bbcea856d/cat.jpg', link: Faker::Placeholdit.image, position: 1)
Section.create!(course_id: 2, title: Faker::ElderScrolls.dragon, content: Faker::Lorem.sentences(25).join(' '), azure: 'https://railsclass.blob.core.windows.net/classuploads/3031abdd364639a439ab10c591378275929ddae09e1c2eedb56cfb94a6f04eb136b7f1d36fd421a6cca3c67821e6a661894079af3333ff6aca0ce62bbcea856d/cat.jpg', link: Faker::Placeholdit.image, position: 2)
Section.create!(course_id: 2, title: Faker::ElderScrolls.dragon, content: Faker::Lorem.sentences(25).join(' '), azure: 'https://railsclass.blob.core.windows.net/classuploads/3031abdd364639a439ab10c591378275929ddae09e1c2eedb56cfb94a6f04eb136b7f1d36fd421a6cca3c67821e6a661894079af3333ff6aca0ce62bbcea856d/cat.jpg', link: Faker::Placeholdit.image, position: 3)
