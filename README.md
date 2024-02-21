#  Solución

- Utilicé Xcode 15.2

- Seleccioné iOS 15 como mínimo deployment target porque fui al App store y vi que las apps de mercado pago y mercado libre soportan de esa versión en adelante, no queria usar cosas que eventualmente no pudiese usar con ustedes

- Creé un modelo para la data del API y otro modelo para la logica de negocios, de esta manera si hay un cambio en el modelo del API no afectaria al modelo de logica de negocios propio de la app

- Creé una abstracción HTTPClient y una implemnetación basada en URLSession, esta abstracción permite que se si en el futuro se quiere usar otro cliente http (por ejemplo Alamofire) solo seria necesario crear una implementación AlamofireHTTPClient y usarla en lugar de la implementación basada en URLSession, este tipo de abstracciones permiten que la logica de negocio esté desacoplada de los frameworks de infraestructura

- Usé injección de dependencias y composition root

- Para la navegación entre pantallas usé el patrón coordinator

- Como posible mejora se podria localizar la App
