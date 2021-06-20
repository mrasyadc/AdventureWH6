--setelah insert data, buatlah index agar mempercepat query

CREATE INDEX marital_key ON WH.Marital (MaritalKey)
CREATE INDEX gender_key ON WH.Gender (GenderKey)
CREATE INDEX title_key ON WH.Title (TitleKey)
CREATE INDEX shift_key ON WH.Shift (ShiftKey)
CREATE INDEX department_key ON WH.Department (DepartmentKey)
CREATE INDEX territory_key ON WH.Territory (TerritoryKey)
CREATE INDEX bio_key ON WH.Bio (BioKey)
CREATE INDEX employee_key ON WH.Employee (EmployeeKey)
CREATE INDEX time_key ON WH.Time (TimeKey)
CREATE INDEX product_category_key ON WH.ProductCategory (ProductCategoryKey)
CREATE INDEX product_subcategory_key ON WH.ProductSubCategory (ProductSubCategoryKey)
CREATE INDEX product_key ON WH.Product (ProductKey)