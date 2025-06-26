; ModuleID = 'svp_simple_031_001-opt.bc'
source_filename = "./svp_simple_031_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.svp_simple_031_001_tc_block_data = type { i8, i8, i8 }

@svp_simple_031_001_tc_chan1_buff = common global [256 x i8] zeroinitializer, align 16
@svp_simple_031_001_tc_buff_p = common global i8* null, align 8
@svp_simple_031_001_tc_block_rcvd_bytes_ch1 = common global i16 0, align 2
@svp_simple_031_001_tc_block_rcvd_bytes = common global i16 0, align 2
@svp_simple_031_001_gloable_var1 = common global i32 0, align 4
@svp_simple_031_001_tc_block_rcvd_bytes_ch2 = common global i16 0, align 2
@svp_simple_031_001_tc_chan2_buff = common global [256 x i8] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define void @svp_simple_031_001_main() #0 !dbg !7 {
  %1 = alloca %struct.svp_simple_031_001_tc_block_data, align 1
  call void (...) @init() #3, !dbg !10
  %2 = bitcast %struct.svp_simple_031_001_tc_block_data* %1 to i8*, !dbg !13
  call void @llvm.lifetime.start.p0i8(i64 3, i8* %2) #3, !dbg !13
  br i1 true, label %3, label %5, !dbg !14

3:                                                ; preds = %0
  store i8* getelementptr inbounds ([256 x i8], [256 x i8]* @svp_simple_031_001_tc_chan1_buff, i32 0, i32 0), i8** @svp_simple_031_001_tc_buff_p, align 8, !dbg !15, !tbaa !16
  %4 = load volatile i16, i16* @svp_simple_031_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !20, !tbaa !21
  store volatile i16 %4, i16* @svp_simple_031_001_tc_block_rcvd_bytes, align 2, !dbg !23, !tbaa !21
  br label %5, !dbg !24

5:                                                ; preds = %3, %0
  %6 = load i8*, i8** @svp_simple_031_001_tc_buff_p, align 8, !dbg !25, !tbaa !16
  %7 = getelementptr inbounds i8, i8* %6, i64 2, !dbg !26
  %8 = load volatile i8, i8* %7, align 1, !dbg !27, !tbaa !28
  %9 = getelementptr inbounds %struct.svp_simple_031_001_tc_block_data, %struct.svp_simple_031_001_tc_block_data* %1, i32 0, i32 0, !dbg !29
  store i8 %8, i8* %9, align 1, !dbg !30, !tbaa !31
  %10 = load i8*, i8** @svp_simple_031_001_tc_buff_p, align 8, !dbg !33, !tbaa !16
  %11 = getelementptr inbounds i8, i8* %10, i64 4, !dbg !34
  %12 = load volatile i8, i8* %11, align 1, !dbg !35, !tbaa !28
  %13 = getelementptr inbounds %struct.svp_simple_031_001_tc_block_data, %struct.svp_simple_031_001_tc_block_data* %1, i32 0, i32 1, !dbg !36
  store i8 %12, i8* %13, align 1, !dbg !37, !tbaa !38
  %14 = load i8*, i8** @svp_simple_031_001_tc_buff_p, align 8, !dbg !39, !tbaa !16
  %15 = getelementptr inbounds i8, i8* %14, i64 5, !dbg !40
  %16 = load volatile i8, i8* %15, align 1, !dbg !41, !tbaa !28
  %17 = getelementptr inbounds %struct.svp_simple_031_001_tc_block_data, %struct.svp_simple_031_001_tc_block_data* %1, i32 0, i32 2, !dbg !42
  store i8 %16, i8* %17, align 1, !dbg !43, !tbaa !44
  %18 = load volatile i16, i16* @svp_simple_031_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !45, !tbaa !21
  %19 = zext i16 %18 to i32, !dbg !45
  %20 = icmp sge i32 %19, 16, !dbg !48
  br i1 %20, label %21, label %svp_simple_031_001_func_3.exit, !dbg !45

21:                                               ; preds = %5
  %22 = load volatile i32, i32* @svp_simple_031_001_gloable_var1, align 4, !dbg !49, !tbaa !50
  %23 = load volatile i16, i16* @svp_simple_031_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !52, !tbaa !21
  %24 = zext i16 %23 to i32, !dbg !52
  %25 = icmp slt i32 %22, %24, !dbg !53
  br i1 %25, label %26, label %28, !dbg !56

26:                                               ; preds = %21
  %27 = mul nsw i32 %22, %24, !dbg !57
  br label %svp_simple_031_001_func_1.exit.i, !dbg !58

28:                                               ; preds = %21
  %29 = load volatile i16, i16* @svp_simple_031_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !59, !tbaa !21
  %30 = zext i16 %29 to i32, !dbg !59
  %31 = icmp sgt i32 %30, 0, !dbg !62
  br i1 %31, label %32, label %33, !dbg !59

32:                                               ; preds = %28
  br label %svp_simple_031_001_func_2.exit.i.i, !dbg !63

33:                                               ; preds = %28
  br label %svp_simple_031_001_func_2.exit.i.i, !dbg !64

svp_simple_031_001_func_2.exit.i.i:               ; preds = %33, %32
  %.0.i.i.i = phi i32 [ 10, %32 ], [ 0, %33 ], !dbg !65
  br label %svp_simple_031_001_func_1.exit.i

svp_simple_031_001_func_1.exit.i:                 ; preds = %svp_simple_031_001_func_2.exit.i.i, %26
  %.0.i.i = phi i32 [ %27, %26 ], [ %.0.i.i.i, %svp_simple_031_001_func_2.exit.i.i ], !dbg !66
  br label %svp_simple_031_001_func_3.exit, !dbg !67

svp_simple_031_001_func_3.exit:                   ; preds = %5, %svp_simple_031_001_func_1.exit.i
  %34 = bitcast %struct.svp_simple_031_001_tc_block_data* %1 to i8*, !dbg !68
  call void @llvm.lifetime.end.p0i8(i64 3, i8* %34) #3, !dbg !68
  ret void, !dbg !68
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define i32 @svp_simple_031_001_func_1(i32 %0, i32 %1) #0 !dbg !54 {
  %3 = icmp slt i32 %0, %1, !dbg !69
  br i1 %3, label %4, label %6, !dbg !70

4:                                                ; preds = %2
  %5 = mul nsw i32 %0, %1, !dbg !71
  br label %12, !dbg !72

6:                                                ; preds = %2
  %7 = load volatile i16, i16* @svp_simple_031_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !73, !tbaa !21
  %8 = zext i16 %7 to i32, !dbg !73
  %9 = icmp sgt i32 %8, 0, !dbg !75
  br i1 %9, label %10, label %11, !dbg !73

10:                                               ; preds = %6
  br label %svp_simple_031_001_func_2.exit, !dbg !76

11:                                               ; preds = %6
  br label %svp_simple_031_001_func_2.exit, !dbg !77

svp_simple_031_001_func_2.exit:                   ; preds = %10, %11
  %.0.i = phi i32 [ 10, %10 ], [ 0, %11 ], !dbg !78
  br label %12

12:                                               ; preds = %svp_simple_031_001_func_2.exit, %4
  %.0 = phi i32 [ %5, %4 ], [ %.0.i, %svp_simple_031_001_func_2.exit ], !dbg !79
  ret i32 %.0, !dbg !80
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_031_001_func_2(i32 %0) #0 !dbg !60 {
  %2 = load volatile i16, i16* @svp_simple_031_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !81, !tbaa !21
  %3 = zext i16 %2 to i32, !dbg !81
  %4 = icmp sgt i32 %3, 0, !dbg !82
  br i1 %4, label %5, label %6, !dbg !81

5:                                                ; preds = %1
  br label %7, !dbg !83

6:                                                ; preds = %1
  br label %7, !dbg !84

7:                                                ; preds = %6, %5
  %.0 = phi i32 [ %0, %5 ], [ 0, %6 ], !dbg !85
  ret i32 %.0, !dbg !86
}

; Function Attrs: nounwind uwtable
define void @svp_simple_031_001_init() #0 !dbg !11 {
  call void (...) @init(), !dbg !87
  ret void, !dbg !88
}

declare void @init(...) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_031_001_func_3() #0 !dbg !46 {
  %1 = load volatile i16, i16* @svp_simple_031_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !89, !tbaa !21
  %2 = zext i16 %1 to i32, !dbg !89
  %3 = icmp sge i32 %2, 16, !dbg !90
  br i1 %3, label %4, label %17, !dbg !89

4:                                                ; preds = %0
  %5 = load volatile i32, i32* @svp_simple_031_001_gloable_var1, align 4, !dbg !91, !tbaa !50
  %6 = load volatile i16, i16* @svp_simple_031_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !92, !tbaa !21
  %7 = zext i16 %6 to i32, !dbg !92
  %8 = icmp slt i32 %5, %7, !dbg !93
  br i1 %8, label %9, label %11, !dbg !95

9:                                                ; preds = %4
  %10 = mul nsw i32 %5, %7, !dbg !96
  br label %svp_simple_031_001_func_1.exit, !dbg !97

11:                                               ; preds = %4
  %12 = load volatile i16, i16* @svp_simple_031_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !98, !tbaa !21
  %13 = zext i16 %12 to i32, !dbg !98
  %14 = icmp sgt i32 %13, 0, !dbg !100
  br i1 %14, label %15, label %16, !dbg !98

15:                                               ; preds = %11
  br label %svp_simple_031_001_func_2.exit.i, !dbg !101

16:                                               ; preds = %11
  br label %svp_simple_031_001_func_2.exit.i, !dbg !102

svp_simple_031_001_func_2.exit.i:                 ; preds = %16, %15
  %.0.i.i = phi i32 [ 10, %15 ], [ 0, %16 ], !dbg !103
  br label %svp_simple_031_001_func_1.exit

svp_simple_031_001_func_1.exit:                   ; preds = %9, %svp_simple_031_001_func_2.exit.i
  %.0.i = phi i32 [ %10, %9 ], [ %.0.i.i, %svp_simple_031_001_func_2.exit.i ], !dbg !104
  br label %17, !dbg !105

17:                                               ; preds = %svp_simple_031_001_func_1.exit, %0
  ret void, !dbg !106
}

; Function Attrs: nounwind uwtable
define void @svp_simple_031_001_isr_1() #0 !dbg !107 {
  %1 = load volatile i32, i32* inttoptr (i64 268435456 to i32*), align 4, !dbg !108, !tbaa !50
  %2 = lshr i32 %1, 3, !dbg !109
  %3 = and i32 %2, 8191, !dbg !110
  %4 = trunc i32 %3 to i16, !dbg !111
  store volatile i16 %4, i16* @svp_simple_031_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !112, !tbaa !21
  ret void, !dbg !113
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_031_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_031")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_031_001_main", scope: !8, file: !8, line: 23, type: !9, scopeLine: 23, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_031_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_031")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 61, column: 3, scope: !11, inlinedAt: !12)
!11 = distinct !DISubprogram(name: "svp_simple_031_001_init", scope: !8, file: !8, line: 57, type: !9, scopeLine: 57, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!12 = distinct !DILocation(line: 24, column: 3, scope: !7)
!13 = !DILocation(line: 25, column: 3, scope: !7)
!14 = !DILocation(line: 28, column: 7, scope: !7)
!15 = !DILocation(line: 29, column: 34, scope: !7)
!16 = !{!17, !17, i64 0}
!17 = !{!"any pointer", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C/C++ TBAA"}
!20 = !DILocation(line: 31, column: 9, scope: !7)
!21 = !{!22, !22, i64 0}
!22 = !{!"short", !18, i64 0}
!23 = !DILocation(line: 30, column: 44, scope: !7)
!24 = !DILocation(line: 32, column: 3, scope: !7)
!25 = !DILocation(line: 34, column: 21, scope: !7)
!26 = !DILocation(line: 34, column: 50, scope: !7)
!27 = !DILocation(line: 34, column: 19, scope: !7)
!28 = !{!18, !18, i64 0}
!29 = !DILocation(line: 34, column: 12, scope: !7)
!30 = !DILocation(line: 34, column: 17, scope: !7)
!31 = !{!32, !18, i64 0}
!32 = !{!"svp_simple_031_001_tc_block_data", !18, i64 0, !18, i64 1, !18, i64 2}
!33 = !DILocation(line: 35, column: 19, scope: !7)
!34 = !DILocation(line: 35, column: 48, scope: !7)
!35 = !DILocation(line: 35, column: 17, scope: !7)
!36 = !DILocation(line: 35, column: 12, scope: !7)
!37 = !DILocation(line: 35, column: 15, scope: !7)
!38 = !{!32, !18, i64 1}
!39 = !DILocation(line: 36, column: 26, scope: !7)
!40 = !DILocation(line: 36, column: 55, scope: !7)
!41 = !DILocation(line: 36, column: 24, scope: !7)
!42 = !DILocation(line: 36, column: 12, scope: !7)
!43 = !DILocation(line: 36, column: 22, scope: !7)
!44 = !{!32, !18, i64 2}
!45 = !DILocation(line: 68, column: 7, scope: !46, inlinedAt: !47)
!46 = distinct !DISubprogram(name: "svp_simple_031_001_func_3", scope: !8, file: !8, line: 64, type: !9, scopeLine: 64, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!47 = distinct !DILocation(line: 37, column: 3, scope: !7)
!48 = !DILocation(line: 68, column: 50, scope: !46, inlinedAt: !47)
!49 = !DILocation(line: 69, column: 31, scope: !46, inlinedAt: !47)
!50 = !{!51, !51, i64 0}
!51 = !{!"int", !18, i64 0}
!52 = !DILocation(line: 70, column: 27, scope: !46, inlinedAt: !47)
!53 = !DILocation(line: 42, column: 9, scope: !54, inlinedAt: !55)
!54 = distinct !DISubprogram(name: "svp_simple_031_001_func_1", scope: !8, file: !8, line: 40, type: !9, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!55 = distinct !DILocation(line: 69, column: 5, scope: !46, inlinedAt: !47)
!56 = !DILocation(line: 42, column: 7, scope: !54, inlinedAt: !55)
!57 = !DILocation(line: 43, column: 11, scope: !54, inlinedAt: !55)
!58 = !DILocation(line: 44, column: 3, scope: !54, inlinedAt: !55)
!59 = !DILocation(line: 50, column: 7, scope: !60, inlinedAt: !61)
!60 = distinct !DISubprogram(name: "svp_simple_031_001_func_2", scope: !8, file: !8, line: 49, type: !9, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!61 = distinct !DILocation(line: 45, column: 9, scope: !54, inlinedAt: !55)
!62 = !DILocation(line: 50, column: 50, scope: !60, inlinedAt: !61)
!63 = !DILocation(line: 51, column: 5, scope: !60, inlinedAt: !61)
!64 = !DILocation(line: 53, column: 5, scope: !60, inlinedAt: !61)
!65 = !DILocation(line: 0, scope: !60, inlinedAt: !61)
!66 = !DILocation(line: 0, scope: !54, inlinedAt: !55)
!67 = !DILocation(line: 71, column: 3, scope: !46, inlinedAt: !47)
!68 = !DILocation(line: 38, column: 1, scope: !7)
!69 = !DILocation(line: 42, column: 9, scope: !54)
!70 = !DILocation(line: 42, column: 7, scope: !54)
!71 = !DILocation(line: 43, column: 11, scope: !54)
!72 = !DILocation(line: 44, column: 3, scope: !54)
!73 = !DILocation(line: 50, column: 7, scope: !60, inlinedAt: !74)
!74 = distinct !DILocation(line: 45, column: 9, scope: !54)
!75 = !DILocation(line: 50, column: 50, scope: !60, inlinedAt: !74)
!76 = !DILocation(line: 51, column: 5, scope: !60, inlinedAt: !74)
!77 = !DILocation(line: 53, column: 5, scope: !60, inlinedAt: !74)
!78 = !DILocation(line: 0, scope: !60, inlinedAt: !74)
!79 = !DILocation(line: 0, scope: !54)
!80 = !DILocation(line: 47, column: 3, scope: !54)
!81 = !DILocation(line: 50, column: 7, scope: !60)
!82 = !DILocation(line: 50, column: 50, scope: !60)
!83 = !DILocation(line: 51, column: 5, scope: !60)
!84 = !DILocation(line: 53, column: 5, scope: !60)
!85 = !DILocation(line: 0, scope: !60)
!86 = !DILocation(line: 55, column: 1, scope: !60)
!87 = !DILocation(line: 61, column: 3, scope: !11)
!88 = !DILocation(line: 62, column: 1, scope: !11)
!89 = !DILocation(line: 68, column: 7, scope: !46)
!90 = !DILocation(line: 68, column: 50, scope: !46)
!91 = !DILocation(line: 69, column: 31, scope: !46)
!92 = !DILocation(line: 70, column: 27, scope: !46)
!93 = !DILocation(line: 42, column: 9, scope: !54, inlinedAt: !94)
!94 = distinct !DILocation(line: 69, column: 5, scope: !46)
!95 = !DILocation(line: 42, column: 7, scope: !54, inlinedAt: !94)
!96 = !DILocation(line: 43, column: 11, scope: !54, inlinedAt: !94)
!97 = !DILocation(line: 44, column: 3, scope: !54, inlinedAt: !94)
!98 = !DILocation(line: 50, column: 7, scope: !60, inlinedAt: !99)
!99 = distinct !DILocation(line: 45, column: 9, scope: !54, inlinedAt: !94)
!100 = !DILocation(line: 50, column: 50, scope: !60, inlinedAt: !99)
!101 = !DILocation(line: 51, column: 5, scope: !60, inlinedAt: !99)
!102 = !DILocation(line: 53, column: 5, scope: !60, inlinedAt: !99)
!103 = !DILocation(line: 0, scope: !60, inlinedAt: !99)
!104 = !DILocation(line: 0, scope: !54, inlinedAt: !94)
!105 = !DILocation(line: 71, column: 3, scope: !46)
!106 = !DILocation(line: 72, column: 1, scope: !46)
!107 = distinct !DISubprogram(name: "svp_simple_031_001_isr_1", scope: !8, file: !8, line: 74, type: !9, scopeLine: 74, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!108 = !DILocation(line: 76, column: 8, scope: !107)
!109 = !DILocation(line: 76, column: 34, scope: !107)
!110 = !DILocation(line: 76, column: 40, scope: !107)
!111 = !DILocation(line: 76, column: 7, scope: !107)
!112 = !DILocation(line: 75, column: 46, scope: !107)
!113 = !DILocation(line: 77, column: 1, scope: !107)
