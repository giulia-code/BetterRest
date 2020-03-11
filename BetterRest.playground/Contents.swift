import CreateML
import Foundation

let data = try MLDataTable(contentsOf: URL(fileURLWithPath: "/Users/macbook/Desktop/better-rest.json"))

let (trainingData, testingData) = data.randomSplit(by: 0.8)

let regressor = try MLRegressor(trainingData: trainingData, targetColumn: "actualSleep")

let evaluationMetrics = regressor.evaluation(on: testingData)
print(evaluationMetrics.rootMeanSquaredError)
print(evaluationMetrics.maximumError)

let metadata = MLModelMetadata(author: "Giulia Catalano", shortDescription: "A model to predict optimum sleep times for coffee drinkers", version: "1.0")

try regressor.write(to: URL(fileURLWithPath: "/Users/macbook/Desktop/SleepCalculator.mlmodel"), metadata: metadata)
