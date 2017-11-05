<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<section class="content-header">
	<ol class="breadcrumb">
		<li><a href="manage/info"><i class="fa fa-dashboard"></i> 首页</a></li>
		<li class="active">系统总览</li>
	</ol>
	</section>

	<!-- Main content -->
	<section class="content"> <!-- Small boxes (Stat box) -->
	<div class="row">
		<div class="col-lg-3 col-xs-6">
			<!-- small box -->
			<div class="small-box bg-green">
				<div class="inner">
					<h3>${taskNumbers[0] }</h3>
					<p>已完成任务</p>
				</div>
				<a data-pjax href="patrol/showTaskList"
					class="small-box-footer">More info <i
					class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>
		<!-- ./col -->
		<div class="col-lg-3 col-xs-6">
			<!-- small box -->
			<div class="small-box bg-aqua">
				<div class="inner">
					<h3>${taskNumbers[1] }</h3>
					<p>待完成任务</p>
				</div>
				<a data-pjax href="patrol/showTaskList"
					class="small-box-footer">More info <i
					class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>
		<!-- ./col -->
		<div class="col-lg-3 col-xs-6">
			<!-- small box -->
			<div class="small-box bg-yellow">
				<div class="inner">
					<h3>${taskNumbers[2] }</h3>
					<p>未按时完成任务</p>
				</div>
				<a data-pjax href="patrol/showTaskList"
					class="small-box-footer">More info <i
					class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>
		<!-- ./col -->
		<div class="col-lg-3 col-xs-6">
			<!-- small box -->
			<div class="small-box bg-red">
				<div class="inner">
					<h3>${taskNumbers[3] }</h3>
					<p>未完成任务</p>
				</div>
				<a data-pjax href="patrol/showTaskList"
					class="small-box-footer">More info<i
					class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>
		<!-- ./col -->
	</div>
	<!-- /.row --> </section>
