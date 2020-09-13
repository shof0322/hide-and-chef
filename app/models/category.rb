class Category < ActiveHash::Base
  self.data = [
   { id: 1, name: '--' },
   { id: 2, name: '和食' },
   { id: 3, name: '洋食' },
   { id: 4, name: '中華' },
   { id: 5, name: 'イタリアン' },
   { id: 6, name: 'フレンチ' },
   { id: 7, name: 'アジア・エスニック' },
   { id: 8, name: 'ベジタリアン' },
   { id: 9, name: 'ヴィーガン' },
   { id: 10, name: 'その他' }
 ]
end
