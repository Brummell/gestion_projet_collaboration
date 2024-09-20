-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: gestion_projet_collaboration
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Commentaire`
--

DROP TABLE IF EXISTS `Commentaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Commentaire` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contenu` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auteurId` int NOT NULL,
  `projetId` int DEFAULT NULL,
  `tacheId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Commentaire_auteurId_fkey` (`auteurId`),
  KEY `Commentaire_projetId_fkey` (`projetId`),
  KEY `Commentaire_tacheId_fkey` (`tacheId`),
  CONSTRAINT `Commentaire_auteurId_fkey` FOREIGN KEY (`auteurId`) REFERENCES `Utilisateur` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Commentaire_projetId_fkey` FOREIGN KEY (`projetId`) REFERENCES `Projet` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Commentaire_tacheId_fkey` FOREIGN KEY (`tacheId`) REFERENCES `Tache` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Commentaire`
--

LOCK TABLES `Commentaire` WRITE;
/*!40000 ALTER TABLE `Commentaire` DISABLE KEYS */;
/*!40000 ALTER TABLE `Commentaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Departement`
--

DROP TABLE IF EXISTS `Departement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Departement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entrepriseId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Departement_entrepriseId_fkey` (`entrepriseId`),
  CONSTRAINT `Departement_entrepriseId_fkey` FOREIGN KEY (`entrepriseId`) REFERENCES `Entreprise` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Departement`
--

LOCK TABLES `Departement` WRITE;
/*!40000 ALTER TABLE `Departement` DISABLE KEYS */;
INSERT INTO `Departement` VALUES (6,'Technique',5),(7,'Commercial',5);
/*!40000 ALTER TABLE `Departement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Entreprise`
--

DROP TABLE IF EXISTS `Entreprise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Entreprise` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createurId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Entreprise_createurId_fkey` (`createurId`),
  CONSTRAINT `Entreprise_createurId_fkey` FOREIGN KEY (`createurId`) REFERENCES `Utilisateur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Entreprise`
--

LOCK TABLES `Entreprise` WRITE;
/*!40000 ALTER TABLE `Entreprise` DISABLE KEYS */;
INSERT INTO `Entreprise` VALUES (5,'tksymfony inc',5);
/*!40000 ALTER TABLE `Entreprise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fichier`
--

DROP TABLE IF EXISTS `Fichier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fichier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tacheId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Fichier_tacheId_fkey` (`tacheId`),
  CONSTRAINT `Fichier_tacheId_fkey` FOREIGN KEY (`tacheId`) REFERENCES `Tache` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fichier`
--

LOCK TABLES `Fichier` WRITE;
/*!40000 ALTER TABLE `Fichier` DISABLE KEYS */;
/*!40000 ALTER TABLE `Fichier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `File`
--

DROP TABLE IF EXISTS `File`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `File` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `messageId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `File_messageId_fkey` (`messageId`),
  CONSTRAINT `File_messageId_fkey` FOREIGN KEY (`messageId`) REFERENCES `Message` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `File`
--

LOCK TABLES `File` WRITE;
/*!40000 ALTER TABLE `File` DISABLE KEYS */;
/*!40000 ALTER TABLE `File` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Like`
--

DROP TABLE IF EXISTS `Like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Like` (
  `id` int NOT NULL AUTO_INCREMENT,
  `utilisateurId` int NOT NULL,
  `messageId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Like_utilisateurId_fkey` (`utilisateurId`),
  KEY `Like_messageId_fkey` (`messageId`),
  CONSTRAINT `Like_messageId_fkey` FOREIGN KEY (`messageId`) REFERENCES `Message` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Like_utilisateurId_fkey` FOREIGN KEY (`utilisateurId`) REFERENCES `Utilisateur` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Like`
--

LOCK TABLES `Like` WRITE;
/*!40000 ALTER TABLE `Like` DISABLE KEYS */;
/*!40000 ALTER TABLE `Like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Message`
--

DROP TABLE IF EXISTS `Message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contenu` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `senderId` int NOT NULL,
  `receiverId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Message_senderId_fkey` (`senderId`),
  KEY `Message_receiverId_fkey` (`receiverId`),
  CONSTRAINT `Message_receiverId_fkey` FOREIGN KEY (`receiverId`) REFERENCES `Utilisateur` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Message_senderId_fkey` FOREIGN KEY (`senderId`) REFERENCES `Utilisateur` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Message`
--

LOCK TABLES `Message` WRITE;
/*!40000 ALTER TABLE `Message` DISABLE KEYS */;
/*!40000 ALTER TABLE `Message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OnlineStatus`
--

DROP TABLE IF EXISTS `OnlineStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OnlineStatus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `utilisateurId` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `OnlineStatus_utilisateurId_key` (`utilisateurId`),
  CONSTRAINT `OnlineStatus_utilisateurId_fkey` FOREIGN KEY (`utilisateurId`) REFERENCES `Utilisateur` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OnlineStatus`
--

LOCK TABLES `OnlineStatus` WRITE;
/*!40000 ALTER TABLE `OnlineStatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `OnlineStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Projet`
--

DROP TABLE IF EXISTS `Projet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Projet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createurId` int NOT NULL,
  `sessionId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Projet_createurId_fkey` (`createurId`),
  KEY `Projet_sessionId_fkey` (`sessionId`),
  CONSTRAINT `Projet_createurId_fkey` FOREIGN KEY (`createurId`) REFERENCES `Utilisateur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Projet_sessionId_fkey` FOREIGN KEY (`sessionId`) REFERENCES `Session` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Projet`
--

LOCK TABLES `Projet` WRITE;
/*!40000 ALTER TABLE `Projet` DISABLE KEYS */;
INSERT INTO `Projet` VALUES (2,'listes_utilisateurs','ok',5,7);
/*!40000 ALTER TABLE `Projet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Session`
--

DROP TABLE IF EXISTS `Session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Session` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departementId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Session_departementId_fkey` (`departementId`),
  CONSTRAINT `Session_departementId_fkey` FOREIGN KEY (`departementId`) REFERENCES `Departement` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Session`
--

LOCK TABLES `Session` WRITE;
/*!40000 ALTER TABLE `Session` DISABLE KEYS */;
INSERT INTO `Session` VALUES (7,'Développement web et mobile','ok',6),(8,'Ventes et Achats','ok',7);
/*!40000 ALTER TABLE `Session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tache`
--

DROP TABLE IF EXISTS `Tache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tache` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `statut` enum('EN_COURS','TERMINE','BLOQUE') COLLATE utf8mb4_unicode_ci NOT NULL,
  `projetId` int NOT NULL,
  `assignerId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Tache_projetId_fkey` (`projetId`),
  KEY `Tache_assignerId_fkey` (`assignerId`),
  CONSTRAINT `Tache_assignerId_fkey` FOREIGN KEY (`assignerId`) REFERENCES `Utilisateur` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Tache_projetId_fkey` FOREIGN KEY (`projetId`) REFERENCES `Projet` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tache`
--

LOCK TABLES `Tache` WRITE;
/*!40000 ALTER TABLE `Tache` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Utilisateur`
--

DROP TABLE IF EXISTS `Utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Utilisateur` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('ADMIN','GUESS','USER') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Utilisateur_email_key` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Utilisateur`
--

LOCK TABLES `Utilisateur` WRITE;
/*!40000 ALTER TABLE `Utilisateur` DISABLE KEYS */;
INSERT INTO `Utilisateur` VALUES (5,'gnangnon83@gmail.com','$2b$10$iRrDc.gxfBR4K.K6IHOZ1elZi83iXlpl3HG2zTiTZL1tZVbUe8Y5u','ADMIN');
/*!40000 ALTER TABLE `Utilisateur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_DepartementsUtilisateur`
--

DROP TABLE IF EXISTS `_DepartementsUtilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_DepartementsUtilisateur` (
  `A` int NOT NULL,
  `B` int NOT NULL,
  UNIQUE KEY `_DepartementsUtilisateur_AB_unique` (`A`,`B`),
  KEY `_DepartementsUtilisateur_B_index` (`B`),
  CONSTRAINT `_DepartementsUtilisateur_A_fkey` FOREIGN KEY (`A`) REFERENCES `Departement` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_DepartementsUtilisateur_B_fkey` FOREIGN KEY (`B`) REFERENCES `Utilisateur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_DepartementsUtilisateur`
--

LOCK TABLES `_DepartementsUtilisateur` WRITE;
/*!40000 ALTER TABLE `_DepartementsUtilisateur` DISABLE KEYS */;
/*!40000 ALTER TABLE `_DepartementsUtilisateur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_EntreprisesUtilisateur`
--

DROP TABLE IF EXISTS `_EntreprisesUtilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_EntreprisesUtilisateur` (
  `A` int NOT NULL,
  `B` int NOT NULL,
  UNIQUE KEY `_EntreprisesUtilisateur_AB_unique` (`A`,`B`),
  KEY `_EntreprisesUtilisateur_B_index` (`B`),
  CONSTRAINT `_EntreprisesUtilisateur_A_fkey` FOREIGN KEY (`A`) REFERENCES `Entreprise` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_EntreprisesUtilisateur_B_fkey` FOREIGN KEY (`B`) REFERENCES `Utilisateur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_EntreprisesUtilisateur`
--

LOCK TABLES `_EntreprisesUtilisateur` WRITE;
/*!40000 ALTER TABLE `_EntreprisesUtilisateur` DISABLE KEYS */;
INSERT INTO `_EntreprisesUtilisateur` VALUES (5,5);
/*!40000 ALTER TABLE `_EntreprisesUtilisateur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_SessionsUtilisateur`
--

DROP TABLE IF EXISTS `_SessionsUtilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_SessionsUtilisateur` (
  `A` int NOT NULL,
  `B` int NOT NULL,
  UNIQUE KEY `_SessionsUtilisateur_AB_unique` (`A`,`B`),
  KEY `_SessionsUtilisateur_B_index` (`B`),
  CONSTRAINT `_SessionsUtilisateur_A_fkey` FOREIGN KEY (`A`) REFERENCES `Session` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_SessionsUtilisateur_B_fkey` FOREIGN KEY (`B`) REFERENCES `Utilisateur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_SessionsUtilisateur`
--

LOCK TABLES `_SessionsUtilisateur` WRITE;
/*!40000 ALTER TABLE `_SessionsUtilisateur` DISABLE KEYS */;
/*!40000 ALTER TABLE `_SessionsUtilisateur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_prisma_migrations`
--

LOCK TABLES `_prisma_migrations` WRITE;
/*!40000 ALTER TABLE `_prisma_migrations` DISABLE KEYS */;
INSERT INTO `_prisma_migrations` VALUES ('222b787e-46b3-46c0-9eb4-b2951b422a85','946a8fc7d27daf33a6ab9559bf3e5479ade8e225137165ce0d35e4e3830c94cc','2024-09-15 08:59:17.486','20240915085858_messageutilisateur',NULL,NULL,'2024-09-15 08:58:58.070',1),('87665873-1e50-4bc0-a83a-0905e9f19d73','4b1ea4d46b7df2838f58a7cc1efc370b4f25713a7250b15388962049750ed3b9','2024-09-08 23:56:42.675','20240908235609_init',NULL,NULL,'2024-09-08 23:56:09.093',1),('8c70ca48-be0a-4971-8a3f-8e57fff4169d','fc95066cca824108502bd13e4a3b443aa7bad8b66140e79bef38e587dd93ca6c','2024-09-09 13:05:34.292','20240909130510_add_entreprise_departement_session',NULL,NULL,'2024-09-09 13:05:10.085',1),('b88d23dc-3ec5-43c4-b537-8af39c5b4cf8','ea4c1f7d06f70f2f5cd9b5744971122fcfd6762da5205caa433b99d29910ce2a','2024-09-15 11:46:31.864','20240915114619_upadateusersession',NULL,NULL,'2024-09-15 11:46:19.120',1);
/*!40000 ALTER TABLE `_prisma_migrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-20 15:28:29
