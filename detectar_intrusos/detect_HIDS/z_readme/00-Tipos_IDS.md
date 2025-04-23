[atrás](../Readme)


# Tipos de IDS

## **HIDS (Host-Based Intrusion Detection System):**

-   **Ventajas:**

    -   Monitorea actividades específicas de cada nodo, como cambios en archivos críticos, procesos sospechosos y accesos no autorizados.
    -   Proporciona una visión detallada de eventos en cada máquina.
-   **Desafíos:**

    -   Requiere la instalación y configuración de agentes en cada nodo, lo que puede complicar la gestión en clústeres grandes.
    -   La escalabilidad puede ser un problema a medida que el clúster crece.

## **NIDS (Network-Based Intrusion Detection System):**

-   **Ventajas:**

    -   Supervisa el tráfico de red dentro del clúster, detectando patrones sospechosos y posibles ataques en la comunicación entre pods y servicios.
    -   Ofrece una visión global del estado de seguridad de la red del clúster.
-   **Desafíos:**

    -   Puede no detectar actividades maliciosas que no generen tráfico de red notable.
    -   La configuración y el mantenimiento pueden ser complejos, especialmente en redes dinámicas y escalables.













