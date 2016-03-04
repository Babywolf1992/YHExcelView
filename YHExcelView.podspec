Pod::Spec.new do |s|
    s.name         = 'YHExcelView'
    s.version      = '0.11'
    s.summary      = 'iOS Similar to excel the rows and columns of tableview 类似于excel多行多列的tableview OC ExcelView GridView'
    s.homepage     = 'https://github.com/ShenYahui/YHExcelView'
    s.license      = 'MIT'
    s.authors      = {'JohnShen' => '472325216@qq.com'}
    s.platform     = :ios, '6.0'
    s.source       = {:git => 'https://github.com/ShenYahui/YHExcelView.git', :tag => s.version}
    s.source_files = 'ExcelView/**/*.{h,m}'
    s.requires_arc = true
end