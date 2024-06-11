# [Enter paper title here]

# Supplementary Material

**Methods and Implementation**

This section describes the design and implementation details of the SQL database schema for integrated clinical and translational data management in oncology research.

**Schema Design**

![](images/ER_Diagram.svg)

**Figure 1:** This diagram depicts the relationships between core entities within the open-source SQL database schema. It serves as a blueprint for the database, designed to integrate clinical and translational data across diverse research studies. The key entities include: **Study:** Represents a clinical trial, encompassing details such as disease focus, treatment arms, and status; **Subject:** Captures information about study participants, including anonymized IDs, visit timestamps, and unique data points (combination of subject ID and visit); **Clinical Data:** Stores patient-specific clinical data collected throughout the study (e.g., vital signs, lab results); **Dataset:** Represents each omics dataset generated from a specific study, linked to the Study table; **Omics Sample:** Represents a biological sample used for omics analysis, linked to both the Dataset and Subject tables; **Metadata:** This includes associated metadata about processing details and sample quality; **Data Level 0:** Stores information about raw data files associated with omics samples (e.g., location of FASTQ files from nextgen genomic sequencing); **Data Level 1:** Represents processed and analysis-ready data files derived from omics samples, typically in a feature-by-sample matrix format linked to the Dataset table. **Relationships:** Lines represent relationships between entities; Arrows indicate the direction of the relationship (e.g., one-to-many).
