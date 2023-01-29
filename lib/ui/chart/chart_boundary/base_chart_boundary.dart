// a convenience class to hold information for the boundary of a chart
class BaseChartBoundary<T> {
  final List<T> _elements;
  final double Function(T)? _propertyFinder;

  double minX;
  double maxX;
  double minY;
  double maxY;

  BaseChartBoundary(this._elements, this._propertyFinder)
      : minX = 0,
        maxX = 0,
        minY = 0,
        maxY = 0;

  BaseChartBoundary.empty() : this([], null);

  double getPropertyValue(T element) {
    return _propertyFinder!(element);
  }

  T findMin() {
    return _elements.reduce((value, element) =>
        getPropertyValue(value) < getPropertyValue(element) ? value : element);
  }

  T findMax() {
    return _elements.reduce((value, element) =>
        getPropertyValue(value) > getPropertyValue(element) ? value : element);
  }

  double calculateMinY() {
    return getPropertyValue(findMin());
  }

  double calculateMaxY() {
    return getPropertyValue(findMax());
  }
}
