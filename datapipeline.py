import schedule 
import time
from pyspark.sql.functions import udf
from pyspark.sql.types import StringType, DoubleType
from pyspark.sql import SparkSession
from pyspark.sql import DataFrameWriter


def pipeline():
    
    spark = SparkSession.builder.appName('movies_data_processing').getOrCreate()
    
    MainDataFrameDF = spark.read.csv(r'C:\Texas State University\Data Warehousing\Data\movies1.csv',inferSchema=True,header=True)

    category_udf = udf(lambda year: 'Old' if year< 2000 else 'New',StringType())
    AgeCategoryDF = MainDataFrameDF.withColumn('age_category',category_udf(MainDataFrameDF.year))
    AG_DF = AgeCategoryDF.select('title','year','age_category')

    AG_DF.write.mode(org.apache.spark.sql.SaveMode.Append).saveAsTable("TransformedData")
   

schedule.every(120).minutes.do(pipeline)

while True:
    schedule.run_pending()
    time.sleep(10)
