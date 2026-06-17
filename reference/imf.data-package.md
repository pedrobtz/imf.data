# imf.data: An Interface to IMF (International Monetary Fund) Data JSON API

A straightforward interface for accessing the IMF (International
Monetary Fund) data JSON API, available at <https://data.imf.org/>. This
package offers direct access to the primary API endpoints: Dataflow,
DataStructure, and CompactData. And, it provides an intuitive interface
for exploring available dimensions and attributes, as well as querying
individual time-series datasets. Additionally, the package implements a
rate limit on API calls to reduce the chances of exceeding service
limits (limited to 10 calls every 5 seconds) and encountering response
errors.

## See also

Useful links:

- <https://pedrobtz.github.io/imf.data/>

- Report bugs at <https://github.com/pedrobtz/imf.data/issues>

## Author

**Maintainer**: Pedro Baltazar <pedrobtz@gmail.com>
