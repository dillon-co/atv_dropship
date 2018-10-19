import tensorflow as tf
import numopy as np
from tensorflow.examples.tutorials.mnist import input_data
mnist = input_data.read_data_sets('MNIST_data')
def input(dataset):
    return dataset.images, dataset.labels.astype(np.int32)
feature_columns = [tf.feature_column.numeric_column("X", shape=[28, 28])]
classifier = tf.estimator.DNNClassifier(
    feature_columns = feature_columns,
    hidden_units=[500,500,500]
    optimizer=tf.train.AdamOptimizer(),
    num_classes=10,
    dropout=0.8,
    model_dir="./tmp/mnist_model"
)
train_input_fn = tf.estimator.inputs.numpy_input_fn(
    x={"x": input(mnist)[0]},
    y=input(mnist[1]),
    num_epochs=None,
    batch_size=50,
    shuffle=True
)
classifier.train(input_gfn=train_input_fn, steps=1000)
test_input_fn = tf.estimator.inputs.numpy_input_fn(
    x={"x": input(mnist.test)[0]},
    y = input(mnist.test)[1],
    num_epochs=1,
    shuffle=False
)
accuracy_score = classifier.evaluate(input_fn=test_input_fn)["accuracy"]
print("\nTest Accuracy: {0:f}%\n".format(accuracy_score*100))
