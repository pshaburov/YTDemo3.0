import turicreate as tc

#Define where the cat can be found in image
annotations = tc.SArray([
[
{'label': 'bottle', 'type': 'rectangle', 'coordinates': {'height': 682, 'width': 156, 'x': 2940, 'y': 682}}
],
[
{'label': 'bottle', 'type': 'rectangle', 'coordinates': {'height': 725, 'width': 437, 'x': 736, 'y': 636}}
],
[
{'label': 'bottle', 'type': 'rectangle', 'coordinates': {'height': 735, 'width': 1032, 'x': 396, 'y': 568}}
],
[
{'label': 'bottle', 'type': 'rectangle', 'coordinates': {'height': 397, 'width': 2249, 'x': 640, 'y': 637}}
],
[
{'label': 'bottle', 'type': 'rectangle', 'coordinates': {'height': 512, 'width': 2148, 'x': 598, 'y': 618}}
],
[
{'label': 'bottle', 'type': 'rectangle', 'coordinates': {'height': 563, 'width': 2061, 'x': 757, 'y': 666}}
],
[
{'label': 'bottle', 'type': 'rectangle', 'coordinates': {'height': 913, 'width': 2200, 'x': 672, 'y': 661}}
],
[
{'label': 'bottle', 'type': 'rectangle', 'coordinates': {'height': 927, 'width': 484, 'x': 762, 'y': 737}}
],
[
{'label': 'bottle', 'type': 'rectangle', 'coordinates': {'height': 459, 'width': 706, 'x': 686, 'y': 648}}
],
[
{'label': 'bottle', 'type': 'rectangle', 'coordinates': {'height': 301, 'width': 354, 'x': 622, 'y': 765}}
],
[
{'label': 'bottle', 'type': 'rectangle', 'coordinates': {'height': 397, 'width': 210, 'x': 570, 'y': 683}}
],
[
{'label': 'bottle', 'type': 'rectangle', 'coordinates': {'height': 361, 'width': 222, 'x': 812, 'y': 869}}
],
[
{'label': 'bottle', 'type': 'rectangle', 'coordinates': {'height': 351, 'width': 308, 'x': 833, 'y': 624}}
],
[
{'label': 'bottle', 'type': 'rectangle', 'coordinates': {'height': 334, 'width': 827, 'x': 694, 'y': 707}}
],
[
{'label': 'bottle', 'type': 'rectangle', 'coordinates': {'height': 846, 'width': 2313, 'x': 601, 'y': 594}}
],
[
{'label': 'bottle', 'type': 'rectangle', 'coordinates': {'height': 930, 'width': 2114, 'x': 692, 'y': 669}}
],
[
{'label': 'bottle', 'type': 'rectangle', 'coordinates': {'height': 804, 'width': 2180, 'x': 572, 'y': 694}}
],
[
{'label': 'bottle', 'type': 'rectangle', 'coordinates': {'height': 901, 'width': 2292, 'x': 518, 'y': 669}}
],
[
{'label': 'bottle', 'type': 'rectangle', 'coordinates': {'height': 929, 'width': 81, 'x': 532, 'y': 620}}
],
[
{'label': 'bottle', 'type': 'rectangle', 'coordinates': {'height': 562, 'width': 75, 'x': 655, 'y': 638}}
],
[
{'label': 'bottle', 'type': 'rectangle', 'coordinates': {'height': 479, 'width': 1109, 'x': 818, 'y': 628}}
],
[
{'label': 'bottle', 'type': 'rectangle', 'coordinates': {'height': 437, 'width': 611, 'x': 774, 'y': 506}}
],
[
{'label': 'bottle', 'type': 'rectangle', 'coordinates': {'height': 383, 'width': 2028, 'x': 645, 'y': 513}}
],
[
{'label': 'bottle', 'type': 'rectangle', 'coordinates': {'height': 350, 'width': 870, 'x': 724, 'y': 615}}
],
[
{'label': 'bottle', 'type': 'rectangle', 'coordinates': {'height': 417, 'width': 876, 'x': 734, 'y': 600}}
],
[
{'label': 'bottle', 'type': 'rectangle', 'coordinates': {'height': 373, 'width': 2140, 'x': 727, 'y': 628}}
],
[
{'label': 'bottle', 'type': 'rectangle', 'coordinates': {'height': 318, 'width': 23, 'x': 709, 'y': 639}}
],
[
{'label': 'bottle', 'type': 'rectangle', 'coordinates': {'height': 274, 'width': 585, 'x': 581, 'y': 612}}
],
[
{'label': 'bottle', 'type': 'rectangle', 'coordinates': {'height': 331, 'width': 6, 'x': 620, 'y': 582}}
],
[
{'label': 'bottle', 'type': 'rectangle', 'coordinates': {'height': 394, 'width': 876, 'x': 517, 'y': 572}}
]
])

#load images
images = tc.SArray([
                    tc.Image('IMG_1493.jpeg')
                    tc.Image('IMG_1487.jpeg')
                    tc.Image('IMG_1478.jpeg')
                    tc.Image('IMG_1450.jpeg')
                    tc.Image('IMG_1444.jpeg')
                    tc.Image('IMG_1445.jpeg')
                    tc.Image('IMG_1451.jpeg')
                    tc.Image('IMG_1479.jpeg')
                    tc.Image('IMG_1486.jpeg')
                    tc.Image('IMG_1484.jpeg')
                    tc.Image('IMG_1490.jpeg')
                    tc.Image('IMG_1447.jpeg')
                    tc.Image('IMG_1453.jpeg')
                    tc.Image('IMG_1452.jpeg')
                    tc.Image('IMG_1446.jpeg')
                    tc.Image('IMG_1491.jpeg')
                    tc.Image('IMG_1485.jpeg')
                    tc.Image('IMG_1481.jpeg')
                    tc.Image('IMG_1495.jpeg')
                    tc.Image('IMG_1442.jpeg')
                    tc.Image('IMG_1456.jpeg')
                    tc.Image('IMG_1457.jpeg')
                    tc.Image('IMG_1443.jpeg')
                    tc.Image('IMG_1494.jpeg')
                    tc.Image('IMG_1480.jpeg')
                    tc.Image('IMG_1496.jpeg')
                    tc.Image('IMG_1482.jpeg')
                    tc.Image('IMG_1455.jpeg')
                    tc.Image('IMG_1441.jpeg')
                    tc.Image('IMG_1469.jpeg')
                    tc.Image('IMG_1509.jpeg')
                    tc.Image('IMG_1508.jpeg')
                    tc.Image('IMG_1468.jpeg')
                    tc.Image('IMG_1440.jpeg')
                    tc.Image('IMG_1454.jpeg')
                    tc.Image('IMG_1483.jpeg')
                    tc.Image('IMG_1497.jpeg')
                    tc.Image('IMG_1433.jpeg')
                    tc.Image('IMG_1435.jpeg')
                    tc.Image('IMG_1434.jpeg')
                    tc.Image('IMG_1436.jpeg')
                    tc.Image('IMG_1437.jpeg')
                    tc.Image('IMG_1439.jpeg')
                    tc.Image('IMG_1438.jpeg')
                    tc.Image('IMG_1459.jpeg')
                    tc.Image('IMG_1471.jpeg')
                    tc.Image('IMG_1465.jpeg')
                    tc.Image('IMG_1505.jpeg')
                    tc.Image('IMG_1511.jpeg')
                    tc.Image('IMG_1510.jpeg')
                    tc.Image('IMG_1504.jpeg')
                    tc.Image('IMG_1464.jpeg')
                    tc.Image('IMG_1470.jpeg')
                    tc.Image('IMG_1458.jpeg')
                    tc.Image('IMG_1499.jpeg')
                    tc.Image('IMG_1466.jpeg')
                    tc.Image('IMG_1472.jpeg')
                    tc.Image('IMG_1512.jpeg')
                    tc.Image('IMG_1506.jpeg')
                    tc.Image('IMG_1507.jpeg')
                    tc.Image('IMG_1473.jpeg')
                    tc.Image('IMG_1467.jpeg')
                    tc.Image('IMG_1498.jpeg')
                    tc.Image('IMG_1488.jpeg')
                    tc.Image('IMG_1463.jpeg')
                    tc.Image('IMG_1477.jpeg')
                    tc.Image('IMG_1503.jpeg')
                    tc.Image('IMG_1502.jpeg')
                    tc.Image('IMG_1476.jpeg')
                    tc.Image('IMG_1462.jpeg')
                    tc.Image('IMG_1489.jpeg')
                    tc.Image('IMG_1474.jpeg')
                    tc.Image('IMG_1460.jpeg')
                    tc.Image('IMG_1448.jpeg')
                    tc.Image('IMG_1500.jpeg')
                    tc.Image('IMG_1501.jpeg')
                    tc.Image('IMG_1449.jpeg')
                    tc.Image('IMG_1461.jpeg')
                    tc.Image('IMG_1475.jpeg')
])


data = tc.SFrame({'image': images, 'annotations': annotations})

train_data, test_data = data.random_split(0.8)
# Create a model
model = tc.object_detector.create(train_data, feature='image', max_iterations=100)

# Save predictions to an SArray
predictions = model.predict(test_data)

# Evaluate the model and save the results into a dictionary
metrics = model.evaluate(test_data)

# Save the model for later use in Turi Create
model.save('painting.model')
model.export_coreml("Painting.mlmodel")
