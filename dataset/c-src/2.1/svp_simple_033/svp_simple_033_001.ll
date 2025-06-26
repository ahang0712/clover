; ModuleID = 'svp_simple_033_001.bc'
source_filename = "./svp_simple_033_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.svp_simple_021_001_tc_block_data = type { i8, i8, i8 }

@svp_simple_021_001_tc_block_rcvd_bytes_ch1 = common global i16 0, align 2
@svp_simple_021_001_tc_block_rcvd_bytes_ch2 = common global i16 0, align 2
@svp_simple_021_001_tc_chan1_buff = common global [256 x i8] zeroinitializer, align 16
@svp_simple_021_001_tc_buff_p = common global i8* null, align 8
@svp_simple_021_001_tc_block_rcvd_bytes = common global i16 0, align 2
@svp_simple_021_001_tc_chan2_buff = common global [256 x i8] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define void @svp_simple_021_001_init() #0 !dbg !7 {
  %1 = call i32 (...) @rand(), !dbg !10
  %2 = trunc i32 %1 to i16, !dbg !10
  store volatile i16 %2, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !11, !tbaa !12
  %3 = call i32 (...) @rand(), !dbg !16
  %4 = trunc i32 %3 to i16, !dbg !16
  store volatile i16 %4, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch2, align 2, !dbg !17, !tbaa !12
  call void (...) @init(), !dbg !18
  ret void, !dbg !19
}

declare i32 @rand(...) #1

declare void @init(...) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_021_001_RecvTcBlock() #0 !dbg !20 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = bitcast i32* %1 to i8*, !dbg !21
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %3) #3, !dbg !21
  store i32 0, i32* %1, align 4, !dbg !22, !tbaa !23
  %4 = load volatile i16, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !25, !tbaa !12
  %5 = zext i16 %4 to i32, !dbg !25
  %6 = icmp sge i32 %5, 16, !dbg !26
  br i1 %6, label %7, label %21, !dbg !25

7:                                                ; preds = %0
  store volatile i16 0, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !27, !tbaa !12
  %8 = bitcast i32* %2 to i8*, !dbg !28
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %8) #3, !dbg !28
  store i32 0, i32* %2, align 4, !dbg !29, !tbaa !23
  br label %9, !dbg !30

9:                                                ; preds = %16, %7
  %10 = load i32, i32* %2, align 4, !dbg !31, !tbaa !23
  %11 = icmp slt i32 %10, 256, !dbg !32
  br i1 %11, label %12, label %19, !dbg !33

12:                                               ; preds = %9
  %13 = load i32, i32* %2, align 4, !dbg !34, !tbaa !23
  %14 = sext i32 %13 to i64, !dbg !35
  %15 = getelementptr inbounds [256 x i8], [256 x i8]* @svp_simple_021_001_tc_chan1_buff, i64 0, i64 %14, !dbg !35
  store volatile i8 0, i8* %15, align 1, !dbg !36, !tbaa !37
  br label %16, !dbg !38

16:                                               ; preds = %12
  %17 = load i32, i32* %2, align 4, !dbg !39, !tbaa !23
  %18 = add nsw i32 %17, 1, !dbg !39
  store i32 %18, i32* %2, align 4, !dbg !39, !tbaa !23
  br label %9, !dbg !33, !llvm.loop !40

19:                                               ; preds = %9
  store i32 255, i32* %1, align 4, !dbg !41, !tbaa !23
  %20 = bitcast i32* %2 to i8*, !dbg !42
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %20) #3, !dbg !42
  br label %21, !dbg !42

21:                                               ; preds = %19, %0
  %22 = bitcast i32* %1 to i8*, !dbg !43
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %22) #3, !dbg !43
  ret void, !dbg !43
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_021_001_main() #0 !dbg !44 {
  %1 = alloca %struct.svp_simple_021_001_tc_block_data, align 1
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = bitcast %struct.svp_simple_021_001_tc_block_data* %1 to i8*, !dbg !45
  call void @llvm.lifetime.start.p0i8(i64 3, i8* %5) #3, !dbg !45
  %6 = call i32 (...) @rand(), !dbg !46
  %7 = trunc i32 %6 to i16, !dbg !46
  store volatile i16 %7, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !47, !tbaa !12
  %8 = call i32 (...) @rand(), !dbg !48
  %9 = trunc i32 %8 to i16, !dbg !48
  store volatile i16 %9, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch2, align 2, !dbg !49, !tbaa !12
  call void (...) @init(), !dbg !50
  %10 = bitcast i32* %2 to i8*, !dbg !51
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %10) #3, !dbg !51
  store i32 0, i32* %2, align 4, !dbg !52, !tbaa !23
  %11 = load volatile i16, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !53, !tbaa !12
  %12 = zext i16 %11 to i32, !dbg !53
  %13 = icmp sge i32 %12, 16, !dbg !54
  br i1 %13, label %14, label %28, !dbg !53

14:                                               ; preds = %0
  store volatile i16 0, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !55, !tbaa !12
  %15 = bitcast i32* %3 to i8*, !dbg !56
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %15) #3, !dbg !56
  store i32 0, i32* %3, align 4, !dbg !57, !tbaa !23
  br label %16, !dbg !58

16:                                               ; preds = %23, %14
  %17 = load i32, i32* %3, align 4, !dbg !59, !tbaa !23
  %18 = icmp slt i32 %17, 256, !dbg !60
  br i1 %18, label %19, label %26, !dbg !61

19:                                               ; preds = %16
  %20 = load i32, i32* %3, align 4, !dbg !62, !tbaa !23
  %21 = sext i32 %20 to i64, !dbg !63
  %22 = getelementptr inbounds [256 x i8], [256 x i8]* @svp_simple_021_001_tc_chan1_buff, i64 0, i64 %21, !dbg !63
  store volatile i8 0, i8* %22, align 1, !dbg !64, !tbaa !37
  br label %23, !dbg !65

23:                                               ; preds = %19
  %24 = load i32, i32* %3, align 4, !dbg !66, !tbaa !23
  %25 = add nsw i32 %24, 1, !dbg !66
  store i32 %25, i32* %3, align 4, !dbg !66, !tbaa !23
  br label %16, !dbg !61, !llvm.loop !67

26:                                               ; preds = %16
  store i32 255, i32* %2, align 4, !dbg !68, !tbaa !23
  %27 = bitcast i32* %3 to i8*, !dbg !69
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %27) #3, !dbg !69
  br label %28, !dbg !69

28:                                               ; preds = %26, %0
  %29 = bitcast i32* %4 to i8*, !dbg !70
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %29) #3, !dbg !70
  store i32 0, i32* %4, align 4, !dbg !71, !tbaa !23
  br label %30, !dbg !72

30:                                               ; preds = %53, %28
  %31 = load i32, i32* %4, align 4, !dbg !73, !tbaa !23
  %32 = icmp slt i32 %31, 2, !dbg !74
  br i1 %32, label %33, label %56, !dbg !75

33:                                               ; preds = %30
  %34 = load i32, i32* %4, align 4, !dbg !76, !tbaa !23
  %35 = icmp eq i32 %34, 0, !dbg !77
  br i1 %35, label %36, label %38, !dbg !76

36:                                               ; preds = %33
  store i8* getelementptr inbounds ([256 x i8], [256 x i8]* @svp_simple_021_001_tc_chan1_buff, i32 0, i32 0), i8** @svp_simple_021_001_tc_buff_p, align 8, !dbg !78, !tbaa !79
  %37 = load volatile i16, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !81, !tbaa !12
  store volatile i16 %37, i16* @svp_simple_021_001_tc_block_rcvd_bytes, align 2, !dbg !82, !tbaa !12
  br label %40, !dbg !83

38:                                               ; preds = %33
  store i8* getelementptr inbounds ([256 x i8], [256 x i8]* @svp_simple_021_001_tc_chan2_buff, i32 0, i32 0), i8** @svp_simple_021_001_tc_buff_p, align 8, !dbg !84, !tbaa !79
  %39 = load volatile i16, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch2, align 2, !dbg !85, !tbaa !12
  store volatile i16 %39, i16* @svp_simple_021_001_tc_block_rcvd_bytes, align 2, !dbg !86, !tbaa !12
  br label %40

40:                                               ; preds = %38, %36
  %41 = load i8*, i8** @svp_simple_021_001_tc_buff_p, align 8, !dbg !87, !tbaa !79
  %42 = getelementptr inbounds i8, i8* %41, i64 2, !dbg !88
  %43 = load volatile i8, i8* %42, align 1, !dbg !89, !tbaa !37
  %44 = getelementptr inbounds %struct.svp_simple_021_001_tc_block_data, %struct.svp_simple_021_001_tc_block_data* %1, i32 0, i32 0, !dbg !90
  store i8 %43, i8* %44, align 1, !dbg !91, !tbaa !92
  %45 = load i8*, i8** @svp_simple_021_001_tc_buff_p, align 8, !dbg !94, !tbaa !79
  %46 = getelementptr inbounds i8, i8* %45, i64 4, !dbg !95
  %47 = load volatile i8, i8* %46, align 1, !dbg !96, !tbaa !37
  %48 = getelementptr inbounds %struct.svp_simple_021_001_tc_block_data, %struct.svp_simple_021_001_tc_block_data* %1, i32 0, i32 1, !dbg !97
  store i8 %47, i8* %48, align 1, !dbg !98, !tbaa !99
  %49 = load i8*, i8** @svp_simple_021_001_tc_buff_p, align 8, !dbg !100, !tbaa !79
  %50 = getelementptr inbounds i8, i8* %49, i64 5, !dbg !101
  %51 = load volatile i8, i8* %50, align 1, !dbg !102, !tbaa !37
  %52 = getelementptr inbounds %struct.svp_simple_021_001_tc_block_data, %struct.svp_simple_021_001_tc_block_data* %1, i32 0, i32 2, !dbg !103
  store i8 %51, i8* %52, align 1, !dbg !104, !tbaa !105
  br label %53, !dbg !106

53:                                               ; preds = %40
  %54 = load i32, i32* %4, align 4, !dbg !107, !tbaa !23
  %55 = add nsw i32 %54, 1, !dbg !107
  store i32 %55, i32* %4, align 4, !dbg !107, !tbaa !23
  br label %30, !dbg !75, !llvm.loop !108

56:                                               ; preds = %30
  %57 = bitcast i32* %4 to i8*, !dbg !109
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %57) #3, !dbg !109
  %58 = bitcast i32* %2 to i8*, !dbg !109
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %58) #3, !dbg !109
  %59 = bitcast %struct.svp_simple_021_001_tc_block_data* %1 to i8*, !dbg !109
  call void @llvm.lifetime.end.p0i8(i64 3, i8* %59) #3, !dbg !109
  ret void, !dbg !109
}

; Function Attrs: nounwind uwtable
define void @svp_simple_021_001_isr_1() #0 !dbg !110 {
  %1 = load volatile i32, i32* inttoptr (i64 268435456 to i32*), align 4, !dbg !111, !tbaa !23
  %2 = lshr i32 %1, 3, !dbg !112
  %3 = and i32 %2, 8191, !dbg !113
  %4 = trunc i32 %3 to i16, !dbg !114
  store volatile i16 %4, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !115, !tbaa !12
  ret void, !dbg !116
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_033_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_033")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_021_001_init", scope: !8, file: !8, line: 36, type: !9, scopeLine: 36, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_033_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_033")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 37, column: 48, scope: !7)
!11 = !DILocation(line: 37, column: 46, scope: !7)
!12 = !{!13, !13, i64 0}
!13 = !{!"short", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C/C++ TBAA"}
!16 = !DILocation(line: 38, column: 48, scope: !7)
!17 = !DILocation(line: 38, column: 46, scope: !7)
!18 = !DILocation(line: 40, column: 3, scope: !7)
!19 = !DILocation(line: 41, column: 1, scope: !7)
!20 = distinct !DISubprogram(name: "svp_simple_021_001_RecvTcBlock", scope: !8, file: !8, line: 43, type: !9, scopeLine: 43, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!21 = !DILocation(line: 44, column: 3, scope: !20)
!22 = !DILocation(line: 45, column: 33, scope: !20)
!23 = !{!24, !24, i64 0}
!24 = !{!"int", !14, i64 0}
!25 = !DILocation(line: 47, column: 7, scope: !20)
!26 = !DILocation(line: 47, column: 50, scope: !20)
!27 = !DILocation(line: 48, column: 48, scope: !20)
!28 = !DILocation(line: 49, column: 5, scope: !20)
!29 = !DILocation(line: 50, column: 12, scope: !20)
!30 = !DILocation(line: 50, column: 10, scope: !20)
!31 = !DILocation(line: 50, column: 17, scope: !20)
!32 = !DILocation(line: 50, column: 19, scope: !20)
!33 = !DILocation(line: 50, column: 5, scope: !20)
!34 = !DILocation(line: 51, column: 40, scope: !20)
!35 = !DILocation(line: 51, column: 7, scope: !20)
!36 = !DILocation(line: 51, column: 43, scope: !20)
!37 = !{!14, !14, i64 0}
!38 = !DILocation(line: 52, column: 5, scope: !20)
!39 = !DILocation(line: 50, column: 27, scope: !20)
!40 = distinct !{!40, !33, !38}
!41 = !DILocation(line: 53, column: 35, scope: !20)
!42 = !DILocation(line: 54, column: 3, scope: !20)
!43 = !DILocation(line: 55, column: 1, scope: !20)
!44 = distinct !DISubprogram(name: "svp_simple_021_001_main", scope: !8, file: !8, line: 57, type: !9, scopeLine: 57, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!45 = !DILocation(line: 58, column: 3, scope: !44)
!46 = !DILocation(line: 60, column: 50, scope: !44)
!47 = !DILocation(line: 60, column: 48, scope: !44)
!48 = !DILocation(line: 61, column: 50, scope: !44)
!49 = !DILocation(line: 61, column: 48, scope: !44)
!50 = !DILocation(line: 63, column: 5, scope: !44)
!51 = !DILocation(line: 65, column: 5, scope: !44)
!52 = !DILocation(line: 66, column: 35, scope: !44)
!53 = !DILocation(line: 68, column: 9, scope: !44)
!54 = !DILocation(line: 68, column: 52, scope: !44)
!55 = !DILocation(line: 69, column: 50, scope: !44)
!56 = !DILocation(line: 70, column: 7, scope: !44)
!57 = !DILocation(line: 71, column: 14, scope: !44)
!58 = !DILocation(line: 71, column: 12, scope: !44)
!59 = !DILocation(line: 71, column: 19, scope: !44)
!60 = !DILocation(line: 71, column: 21, scope: !44)
!61 = !DILocation(line: 71, column: 7, scope: !44)
!62 = !DILocation(line: 72, column: 42, scope: !44)
!63 = !DILocation(line: 72, column: 9, scope: !44)
!64 = !DILocation(line: 72, column: 45, scope: !44)
!65 = !DILocation(line: 73, column: 7, scope: !44)
!66 = !DILocation(line: 71, column: 29, scope: !44)
!67 = distinct !{!67, !61, !65}
!68 = !DILocation(line: 74, column: 37, scope: !44)
!69 = !DILocation(line: 75, column: 5, scope: !44)
!70 = !DILocation(line: 76, column: 3, scope: !44)
!71 = !DILocation(line: 77, column: 14, scope: !44)
!72 = !DILocation(line: 77, column: 8, scope: !44)
!73 = !DILocation(line: 77, column: 19, scope: !44)
!74 = !DILocation(line: 77, column: 25, scope: !44)
!75 = !DILocation(line: 77, column: 3, scope: !44)
!76 = !DILocation(line: 78, column: 9, scope: !44)
!77 = !DILocation(line: 78, column: 15, scope: !44)
!78 = !DILocation(line: 79, column: 36, scope: !44)
!79 = !{!80, !80, i64 0}
!80 = !{!"any pointer", !14, i64 0}
!81 = !DILocation(line: 81, column: 11, scope: !44)
!82 = !DILocation(line: 80, column: 46, scope: !44)
!83 = !DILocation(line: 82, column: 5, scope: !44)
!84 = !DILocation(line: 83, column: 36, scope: !44)
!85 = !DILocation(line: 85, column: 11, scope: !44)
!86 = !DILocation(line: 84, column: 46, scope: !44)
!87 = !DILocation(line: 88, column: 23, scope: !44)
!88 = !DILocation(line: 88, column: 52, scope: !44)
!89 = !DILocation(line: 88, column: 21, scope: !44)
!90 = !DILocation(line: 88, column: 14, scope: !44)
!91 = !DILocation(line: 88, column: 19, scope: !44)
!92 = !{!93, !14, i64 0}
!93 = !{!"svp_simple_021_001_tc_block_data", !14, i64 0, !14, i64 1, !14, i64 2}
!94 = !DILocation(line: 89, column: 21, scope: !44)
!95 = !DILocation(line: 89, column: 50, scope: !44)
!96 = !DILocation(line: 89, column: 19, scope: !44)
!97 = !DILocation(line: 89, column: 14, scope: !44)
!98 = !DILocation(line: 89, column: 17, scope: !44)
!99 = !{!93, !14, i64 1}
!100 = !DILocation(line: 90, column: 28, scope: !44)
!101 = !DILocation(line: 90, column: 57, scope: !44)
!102 = !DILocation(line: 90, column: 26, scope: !44)
!103 = !DILocation(line: 90, column: 14, scope: !44)
!104 = !DILocation(line: 90, column: 24, scope: !44)
!105 = !{!93, !14, i64 2}
!106 = !DILocation(line: 91, column: 3, scope: !44)
!107 = !DILocation(line: 77, column: 35, scope: !44)
!108 = distinct !{!108, !75, !106}
!109 = !DILocation(line: 92, column: 1, scope: !44)
!110 = distinct !DISubprogram(name: "svp_simple_021_001_isr_1", scope: !8, file: !8, line: 94, type: !9, scopeLine: 94, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!111 = !DILocation(line: 96, column: 8, scope: !110)
!112 = !DILocation(line: 96, column: 34, scope: !110)
!113 = !DILocation(line: 96, column: 40, scope: !110)
!114 = !DILocation(line: 96, column: 7, scope: !110)
!115 = !DILocation(line: 95, column: 46, scope: !110)
!116 = !DILocation(line: 97, column: 1, scope: !110)
