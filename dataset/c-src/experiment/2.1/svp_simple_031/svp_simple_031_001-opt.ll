; ModuleID = 'svp_simple_031_001-opt.bc'
source_filename = "./svp_simple_031_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.svp_simple_031_001_tc_block_data = type { i8, i8, i8 }

@svp_simple_031_001_tc_chan1_buff = common global [256 x i8] zeroinitializer, align 16
@svp_simple_031_001_tc_buff_p = common global i8* null, align 8
@svp_simple_031_001_tc_block_rcvd_bytes_ch1 = common global i16 0, align 2
@svp_simple_031_001_tc_block_rcvd_bytes = common global i16 0, align 2
@svp_simple_031_001_tc_block_rcvd_bytes_ch2 = common global i16 0, align 2
@svp_simple_031_001_gloable_var1 = common global i32 0, align 4
@svp_simple_031_001_tc_chan2_buff = common global [256 x i8] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define void @svp_simple_031_001_main() #0 !dbg !7 {
  %1 = alloca %struct.svp_simple_031_001_tc_block_data, align 1
  %2 = call i32 (...) @rand() #3, !dbg !10
  %3 = trunc i32 %2 to i16, !dbg !10
  store volatile i16 %3, i16* @svp_simple_031_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !13, !tbaa !14
  %4 = call i32 (...) @rand() #3, !dbg !18
  %5 = trunc i32 %4 to i16, !dbg !18
  store volatile i16 %5, i16* @svp_simple_031_001_tc_block_rcvd_bytes_ch2, align 2, !dbg !19, !tbaa !14
  call void (...) @init() #3, !dbg !20
  %6 = bitcast %struct.svp_simple_031_001_tc_block_data* %1 to i8*, !dbg !21
  call void @llvm.lifetime.start.p0i8(i64 3, i8* %6) #3, !dbg !21
  br i1 true, label %7, label %9, !dbg !22

7:                                                ; preds = %0
  store i8* getelementptr inbounds ([256 x i8], [256 x i8]* @svp_simple_031_001_tc_chan1_buff, i32 0, i32 0), i8** @svp_simple_031_001_tc_buff_p, align 8, !dbg !23, !tbaa !24
  %8 = load volatile i16, i16* @svp_simple_031_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !26, !tbaa !14
  store volatile i16 %8, i16* @svp_simple_031_001_tc_block_rcvd_bytes, align 2, !dbg !27, !tbaa !14
  br label %9, !dbg !28

9:                                                ; preds = %7, %0
  %10 = load i8*, i8** @svp_simple_031_001_tc_buff_p, align 8, !dbg !29, !tbaa !24
  %11 = getelementptr inbounds i8, i8* %10, i64 2, !dbg !30
  %12 = load volatile i8, i8* %11, align 1, !dbg !31, !tbaa !32
  %13 = getelementptr inbounds %struct.svp_simple_031_001_tc_block_data, %struct.svp_simple_031_001_tc_block_data* %1, i32 0, i32 0, !dbg !33
  store i8 %12, i8* %13, align 1, !dbg !34, !tbaa !35
  %14 = load i8*, i8** @svp_simple_031_001_tc_buff_p, align 8, !dbg !37, !tbaa !24
  %15 = getelementptr inbounds i8, i8* %14, i64 4, !dbg !38
  %16 = load volatile i8, i8* %15, align 1, !dbg !39, !tbaa !32
  %17 = getelementptr inbounds %struct.svp_simple_031_001_tc_block_data, %struct.svp_simple_031_001_tc_block_data* %1, i32 0, i32 1, !dbg !40
  store i8 %16, i8* %17, align 1, !dbg !41, !tbaa !42
  %18 = load i8*, i8** @svp_simple_031_001_tc_buff_p, align 8, !dbg !43, !tbaa !24
  %19 = getelementptr inbounds i8, i8* %18, i64 5, !dbg !44
  %20 = load volatile i8, i8* %19, align 1, !dbg !45, !tbaa !32
  %21 = getelementptr inbounds %struct.svp_simple_031_001_tc_block_data, %struct.svp_simple_031_001_tc_block_data* %1, i32 0, i32 2, !dbg !46
  store i8 %20, i8* %21, align 1, !dbg !47, !tbaa !48
  %22 = load volatile i16, i16* @svp_simple_031_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !49, !tbaa !14
  %23 = zext i16 %22 to i32, !dbg !49
  %24 = icmp sge i32 %23, 16, !dbg !52
  br i1 %24, label %25, label %svp_simple_031_001_func_3.exit, !dbg !49

25:                                               ; preds = %9
  %26 = load volatile i32, i32* @svp_simple_031_001_gloable_var1, align 4, !dbg !53, !tbaa !54
  %27 = load volatile i16, i16* @svp_simple_031_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !56, !tbaa !14
  %28 = zext i16 %27 to i32, !dbg !56
  %29 = icmp slt i32 %26, %28, !dbg !57
  br i1 %29, label %30, label %32, !dbg !60

30:                                               ; preds = %25
  %31 = mul nsw i32 %26, %28, !dbg !61
  br label %svp_simple_031_001_func_1.exit.i, !dbg !62

32:                                               ; preds = %25
  %33 = load volatile i16, i16* @svp_simple_031_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !63, !tbaa !14
  %34 = zext i16 %33 to i32, !dbg !63
  %35 = icmp sgt i32 %34, 0, !dbg !66
  br i1 %35, label %36, label %37, !dbg !63

36:                                               ; preds = %32
  br label %svp_simple_031_001_func_2.exit.i.i, !dbg !67

37:                                               ; preds = %32
  br label %svp_simple_031_001_func_2.exit.i.i, !dbg !68

svp_simple_031_001_func_2.exit.i.i:               ; preds = %37, %36
  %.0.i.i.i = phi i32 [ 10, %36 ], [ 0, %37 ], !dbg !69
  br label %svp_simple_031_001_func_1.exit.i

svp_simple_031_001_func_1.exit.i:                 ; preds = %svp_simple_031_001_func_2.exit.i.i, %30
  %.0.i.i = phi i32 [ %31, %30 ], [ %.0.i.i.i, %svp_simple_031_001_func_2.exit.i.i ], !dbg !70
  br label %svp_simple_031_001_func_3.exit, !dbg !71

svp_simple_031_001_func_3.exit:                   ; preds = %9, %svp_simple_031_001_func_1.exit.i
  %38 = bitcast %struct.svp_simple_031_001_tc_block_data* %1 to i8*, !dbg !72
  call void @llvm.lifetime.end.p0i8(i64 3, i8* %38) #3, !dbg !72
  ret void, !dbg !72
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define i32 @svp_simple_031_001_func_1(i32 %0, i32 %1) #0 !dbg !58 {
  %3 = icmp slt i32 %0, %1, !dbg !73
  br i1 %3, label %4, label %6, !dbg !74

4:                                                ; preds = %2
  %5 = mul nsw i32 %0, %1, !dbg !75
  br label %12, !dbg !76

6:                                                ; preds = %2
  %7 = load volatile i16, i16* @svp_simple_031_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !77, !tbaa !14
  %8 = zext i16 %7 to i32, !dbg !77
  %9 = icmp sgt i32 %8, 0, !dbg !79
  br i1 %9, label %10, label %11, !dbg !77

10:                                               ; preds = %6
  br label %svp_simple_031_001_func_2.exit, !dbg !80

11:                                               ; preds = %6
  br label %svp_simple_031_001_func_2.exit, !dbg !81

svp_simple_031_001_func_2.exit:                   ; preds = %10, %11
  %.0.i = phi i32 [ 10, %10 ], [ 0, %11 ], !dbg !82
  br label %12

12:                                               ; preds = %svp_simple_031_001_func_2.exit, %4
  %.0 = phi i32 [ %5, %4 ], [ %.0.i, %svp_simple_031_001_func_2.exit ], !dbg !83
  ret i32 %.0, !dbg !84
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_031_001_func_2(i32 %0) #0 !dbg !64 {
  %2 = load volatile i16, i16* @svp_simple_031_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !85, !tbaa !14
  %3 = zext i16 %2 to i32, !dbg !85
  %4 = icmp sgt i32 %3, 0, !dbg !86
  br i1 %4, label %5, label %6, !dbg !85

5:                                                ; preds = %1
  br label %7, !dbg !87

6:                                                ; preds = %1
  br label %7, !dbg !88

7:                                                ; preds = %6, %5
  %.0 = phi i32 [ %0, %5 ], [ 0, %6 ], !dbg !89
  ret i32 %.0, !dbg !90
}

; Function Attrs: nounwind uwtable
define void @svp_simple_031_001_init() #0 !dbg !11 {
  %1 = call i32 (...) @rand(), !dbg !91
  %2 = trunc i32 %1 to i16, !dbg !91
  store volatile i16 %2, i16* @svp_simple_031_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !92, !tbaa !14
  %3 = call i32 (...) @rand(), !dbg !93
  %4 = trunc i32 %3 to i16, !dbg !93
  store volatile i16 %4, i16* @svp_simple_031_001_tc_block_rcvd_bytes_ch2, align 2, !dbg !94, !tbaa !14
  call void (...) @init(), !dbg !95
  ret void, !dbg !96
}

declare i32 @rand(...) #2

declare void @init(...) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_031_001_func_3() #0 !dbg !50 {
  %1 = load volatile i16, i16* @svp_simple_031_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !97, !tbaa !14
  %2 = zext i16 %1 to i32, !dbg !97
  %3 = icmp sge i32 %2, 16, !dbg !98
  br i1 %3, label %4, label %17, !dbg !97

4:                                                ; preds = %0
  %5 = load volatile i32, i32* @svp_simple_031_001_gloable_var1, align 4, !dbg !99, !tbaa !54
  %6 = load volatile i16, i16* @svp_simple_031_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !100, !tbaa !14
  %7 = zext i16 %6 to i32, !dbg !100
  %8 = icmp slt i32 %5, %7, !dbg !101
  br i1 %8, label %9, label %11, !dbg !103

9:                                                ; preds = %4
  %10 = mul nsw i32 %5, %7, !dbg !104
  br label %svp_simple_031_001_func_1.exit, !dbg !105

11:                                               ; preds = %4
  %12 = load volatile i16, i16* @svp_simple_031_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !106, !tbaa !14
  %13 = zext i16 %12 to i32, !dbg !106
  %14 = icmp sgt i32 %13, 0, !dbg !108
  br i1 %14, label %15, label %16, !dbg !106

15:                                               ; preds = %11
  br label %svp_simple_031_001_func_2.exit.i, !dbg !109

16:                                               ; preds = %11
  br label %svp_simple_031_001_func_2.exit.i, !dbg !110

svp_simple_031_001_func_2.exit.i:                 ; preds = %16, %15
  %.0.i.i = phi i32 [ 10, %15 ], [ 0, %16 ], !dbg !111
  br label %svp_simple_031_001_func_1.exit

svp_simple_031_001_func_1.exit:                   ; preds = %9, %svp_simple_031_001_func_2.exit.i
  %.0.i = phi i32 [ %10, %9 ], [ %.0.i.i, %svp_simple_031_001_func_2.exit.i ], !dbg !112
  br label %17, !dbg !113

17:                                               ; preds = %svp_simple_031_001_func_1.exit, %0
  ret void, !dbg !114
}

; Function Attrs: nounwind uwtable
define void @svp_simple_031_001_isr_1() #0 !dbg !115 {
  %1 = load volatile i32, i32* inttoptr (i64 268435456 to i32*), align 4, !dbg !116, !tbaa !54
  %2 = lshr i32 %1, 3, !dbg !117
  %3 = and i32 %2, 8191, !dbg !118
  %4 = trunc i32 %3 to i16, !dbg !119
  store volatile i16 %4, i16* @svp_simple_031_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !120, !tbaa !14
  ret void, !dbg !121
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_031_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_031")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_031_001_main", scope: !8, file: !8, line: 38, type: !9, scopeLine: 38, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_031_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_031")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 73, column: 48, scope: !11, inlinedAt: !12)
!11 = distinct !DISubprogram(name: "svp_simple_031_001_init", scope: !8, file: !8, line: 72, type: !9, scopeLine: 72, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!12 = distinct !DILocation(line: 39, column: 3, scope: !7)
!13 = !DILocation(line: 73, column: 46, scope: !11, inlinedAt: !12)
!14 = !{!15, !15, i64 0}
!15 = !{!"short", !16, i64 0}
!16 = !{!"omnipotent char", !17, i64 0}
!17 = !{!"Simple C/C++ TBAA"}
!18 = !DILocation(line: 74, column: 48, scope: !11, inlinedAt: !12)
!19 = !DILocation(line: 74, column: 46, scope: !11, inlinedAt: !12)
!20 = !DILocation(line: 76, column: 3, scope: !11, inlinedAt: !12)
!21 = !DILocation(line: 40, column: 3, scope: !7)
!22 = !DILocation(line: 43, column: 7, scope: !7)
!23 = !DILocation(line: 44, column: 34, scope: !7)
!24 = !{!25, !25, i64 0}
!25 = !{!"any pointer", !16, i64 0}
!26 = !DILocation(line: 46, column: 9, scope: !7)
!27 = !DILocation(line: 45, column: 44, scope: !7)
!28 = !DILocation(line: 47, column: 3, scope: !7)
!29 = !DILocation(line: 49, column: 21, scope: !7)
!30 = !DILocation(line: 49, column: 50, scope: !7)
!31 = !DILocation(line: 49, column: 19, scope: !7)
!32 = !{!16, !16, i64 0}
!33 = !DILocation(line: 49, column: 12, scope: !7)
!34 = !DILocation(line: 49, column: 17, scope: !7)
!35 = !{!36, !16, i64 0}
!36 = !{!"svp_simple_031_001_tc_block_data", !16, i64 0, !16, i64 1, !16, i64 2}
!37 = !DILocation(line: 50, column: 19, scope: !7)
!38 = !DILocation(line: 50, column: 48, scope: !7)
!39 = !DILocation(line: 50, column: 17, scope: !7)
!40 = !DILocation(line: 50, column: 12, scope: !7)
!41 = !DILocation(line: 50, column: 15, scope: !7)
!42 = !{!36, !16, i64 1}
!43 = !DILocation(line: 51, column: 26, scope: !7)
!44 = !DILocation(line: 51, column: 55, scope: !7)
!45 = !DILocation(line: 51, column: 24, scope: !7)
!46 = !DILocation(line: 51, column: 12, scope: !7)
!47 = !DILocation(line: 51, column: 22, scope: !7)
!48 = !{!36, !16, i64 2}
!49 = !DILocation(line: 83, column: 7, scope: !50, inlinedAt: !51)
!50 = distinct !DISubprogram(name: "svp_simple_031_001_func_3", scope: !8, file: !8, line: 79, type: !9, scopeLine: 79, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!51 = distinct !DILocation(line: 52, column: 3, scope: !7)
!52 = !DILocation(line: 83, column: 50, scope: !50, inlinedAt: !51)
!53 = !DILocation(line: 84, column: 31, scope: !50, inlinedAt: !51)
!54 = !{!55, !55, i64 0}
!55 = !{!"int", !16, i64 0}
!56 = !DILocation(line: 85, column: 27, scope: !50, inlinedAt: !51)
!57 = !DILocation(line: 57, column: 9, scope: !58, inlinedAt: !59)
!58 = distinct !DISubprogram(name: "svp_simple_031_001_func_1", scope: !8, file: !8, line: 55, type: !9, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!59 = distinct !DILocation(line: 84, column: 5, scope: !50, inlinedAt: !51)
!60 = !DILocation(line: 57, column: 7, scope: !58, inlinedAt: !59)
!61 = !DILocation(line: 58, column: 11, scope: !58, inlinedAt: !59)
!62 = !DILocation(line: 59, column: 3, scope: !58, inlinedAt: !59)
!63 = !DILocation(line: 65, column: 7, scope: !64, inlinedAt: !65)
!64 = distinct !DISubprogram(name: "svp_simple_031_001_func_2", scope: !8, file: !8, line: 64, type: !9, scopeLine: 64, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!65 = distinct !DILocation(line: 60, column: 9, scope: !58, inlinedAt: !59)
!66 = !DILocation(line: 65, column: 50, scope: !64, inlinedAt: !65)
!67 = !DILocation(line: 66, column: 5, scope: !64, inlinedAt: !65)
!68 = !DILocation(line: 68, column: 5, scope: !64, inlinedAt: !65)
!69 = !DILocation(line: 0, scope: !64, inlinedAt: !65)
!70 = !DILocation(line: 0, scope: !58, inlinedAt: !59)
!71 = !DILocation(line: 86, column: 3, scope: !50, inlinedAt: !51)
!72 = !DILocation(line: 53, column: 1, scope: !7)
!73 = !DILocation(line: 57, column: 9, scope: !58)
!74 = !DILocation(line: 57, column: 7, scope: !58)
!75 = !DILocation(line: 58, column: 11, scope: !58)
!76 = !DILocation(line: 59, column: 3, scope: !58)
!77 = !DILocation(line: 65, column: 7, scope: !64, inlinedAt: !78)
!78 = distinct !DILocation(line: 60, column: 9, scope: !58)
!79 = !DILocation(line: 65, column: 50, scope: !64, inlinedAt: !78)
!80 = !DILocation(line: 66, column: 5, scope: !64, inlinedAt: !78)
!81 = !DILocation(line: 68, column: 5, scope: !64, inlinedAt: !78)
!82 = !DILocation(line: 0, scope: !64, inlinedAt: !78)
!83 = !DILocation(line: 0, scope: !58)
!84 = !DILocation(line: 62, column: 3, scope: !58)
!85 = !DILocation(line: 65, column: 7, scope: !64)
!86 = !DILocation(line: 65, column: 50, scope: !64)
!87 = !DILocation(line: 66, column: 5, scope: !64)
!88 = !DILocation(line: 68, column: 5, scope: !64)
!89 = !DILocation(line: 0, scope: !64)
!90 = !DILocation(line: 70, column: 1, scope: !64)
!91 = !DILocation(line: 73, column: 48, scope: !11)
!92 = !DILocation(line: 73, column: 46, scope: !11)
!93 = !DILocation(line: 74, column: 48, scope: !11)
!94 = !DILocation(line: 74, column: 46, scope: !11)
!95 = !DILocation(line: 76, column: 3, scope: !11)
!96 = !DILocation(line: 77, column: 1, scope: !11)
!97 = !DILocation(line: 83, column: 7, scope: !50)
!98 = !DILocation(line: 83, column: 50, scope: !50)
!99 = !DILocation(line: 84, column: 31, scope: !50)
!100 = !DILocation(line: 85, column: 27, scope: !50)
!101 = !DILocation(line: 57, column: 9, scope: !58, inlinedAt: !102)
!102 = distinct !DILocation(line: 84, column: 5, scope: !50)
!103 = !DILocation(line: 57, column: 7, scope: !58, inlinedAt: !102)
!104 = !DILocation(line: 58, column: 11, scope: !58, inlinedAt: !102)
!105 = !DILocation(line: 59, column: 3, scope: !58, inlinedAt: !102)
!106 = !DILocation(line: 65, column: 7, scope: !64, inlinedAt: !107)
!107 = distinct !DILocation(line: 60, column: 9, scope: !58, inlinedAt: !102)
!108 = !DILocation(line: 65, column: 50, scope: !64, inlinedAt: !107)
!109 = !DILocation(line: 66, column: 5, scope: !64, inlinedAt: !107)
!110 = !DILocation(line: 68, column: 5, scope: !64, inlinedAt: !107)
!111 = !DILocation(line: 0, scope: !64, inlinedAt: !107)
!112 = !DILocation(line: 0, scope: !58, inlinedAt: !102)
!113 = !DILocation(line: 86, column: 3, scope: !50)
!114 = !DILocation(line: 87, column: 1, scope: !50)
!115 = distinct !DISubprogram(name: "svp_simple_031_001_isr_1", scope: !8, file: !8, line: 89, type: !9, scopeLine: 89, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!116 = !DILocation(line: 91, column: 8, scope: !115)
!117 = !DILocation(line: 91, column: 34, scope: !115)
!118 = !DILocation(line: 91, column: 40, scope: !115)
!119 = !DILocation(line: 91, column: 7, scope: !115)
!120 = !DILocation(line: 90, column: 46, scope: !115)
!121 = !DILocation(line: 92, column: 1, scope: !115)
