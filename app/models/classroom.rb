class Classroom < ActiveHash::Base
  self.data = [
    { id: 0, number: '--' },
    { id: 1, number: '001' },
    { id: 2, number: '002' },
    { id: 3, number: '003' },
    { id: 4, number: '004' },
    { id: 5, number: '005' },
    { id: 6, number: '006' },
    { id: 7, number: '007' },
    { id: 8, number: '008' },
    { id: 9, number: '009' },
    { id: 10, number: '201' },
    { id: 11, number: '202' },
    { id: 12, number: '203' },
    { id: 13, number: '204' },
    { id: 14, number: '205' },
    { id: 15, number: '206' },
    { id: 16, number: '207' },
    { id: 17, number: '208' },
    { id: 18, number: '209' },
    { id: 19, number: '301' },
    { id: 20, number: '302' },
    { id: 21, number: '303' },
    { id: 22, number: '304' },
    { id: 23, number: '305' },
    { id: 24, number: '306' },
    { id: 25, number: '307' },
    { id: 26, number: '308' },
    { id: 27, number: '309' }
  ]

  include ActiveHash::Associations
  has_many :checksheets

  end