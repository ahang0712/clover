; ModuleID = 'svp_simple_001_001-opt.bc'
source_filename = "./svp_simple_001_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_001_001_global_flag = global i32 0, align 4
@svp_simple_001_001_global_array = common global [10000 x i32] zeroinitializer, align 16
@svp_simple_001_001_global_var = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_001_001_main() #0 !dbg !7 {
  call void (...) @init(), !dbg !10
  call void @disable_isr(i32 2), !dbg !11
  call void (...) @idlerun(), !dbg !12
  br label %1, !dbg !13

1:                                                ; preds = %7, %0
  %.0 = phi i32 [ 0, %0 ], [ %8, %7 ], !dbg !14
  %2 = icmp slt i32 %.0, 10000, !dbg !15
  br i1 %2, label %4, label %3, !dbg !16

3:                                                ; preds = %1
  br label %9

4:                                                ; preds = %1
  %5 = sext i32 %.0 to i64, !dbg !17
  %6 = getelementptr inbounds [10000 x i32], [10000 x i32]* @svp_simple_001_001_global_array, i64 0, i64 %5, !dbg !17
  store volatile i32 0, i32* %6, align 4, !dbg !18, !tbaa !19
  br label %7, !dbg !17

7:                                                ; preds = %4
  %8 = add nsw i32 %.0, 1, !dbg !23
  br label %1, !dbg !16, !llvm.loop !24

9:                                                ; preds = %3
  br label %10, !dbg !26

10:                                               ; preds = %19, %9
  %.01 = phi i32 [ 0, %9 ], [ %20, %19 ], !dbg !14
  %11 = icmp slt i32 %.01, 10000, !dbg !27
  br i1 %11, label %13, label %12, !dbg !28

12:                                               ; preds = %10
  br label %21

13:                                               ; preds = %10
  %14 = icmp eq i32 %.01, 9999, !dbg !29
  br i1 %14, label %15, label %18, !dbg !30

15:                                               ; preds = %13
  %16 = sext i32 %.01 to i64, !dbg !31
  %17 = getelementptr inbounds [10000 x i32], [10000 x i32]* @svp_simple_001_001_global_array, i64 0, i64 %16, !dbg !31
  store volatile i32 1, i32* %17, align 4, !dbg !32, !tbaa !19
  br label %18, !dbg !31

18:                                               ; preds = %15, %13
  br label %19, !dbg !33

19:                                               ; preds = %18
  %20 = add nsw i32 %.01, 1, !dbg !34
  br label %10, !dbg !28, !llvm.loop !35

21:                                               ; preds = %12
  ret void, !dbg !36
}

declare void @init(...) #1

declare void @disable_isr(i32) #1

declare void @idlerun(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_001_001_isr_1() #0 !dbg !37 {
  call void (...) @idlerun(), !dbg !38
  store volatile i32 1, i32* @svp_simple_001_001_global_flag, align 4, !dbg !39, !tbaa !19
  store volatile i32 0, i32* @svp_simple_001_001_global_var, align 4, !dbg !40, !tbaa !19
  store volatile i32 1, i32* @svp_simple_001_001_global_var, align 4, !dbg !41, !tbaa !19
  call void @enable_isr(i32 2), !dbg !42
  call void (...) @idlerun(), !dbg !43
  ret void, !dbg !44
}

declare void @enable_isr(i32) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_001_001_isr_2() #0 !dbg !45 {
  %1 = load volatile i32, i32* @svp_simple_001_001_global_flag, align 4, !dbg !46, !tbaa !19
  %2 = icmp eq i32 %1, 1, !dbg !47
  br i1 %2, label %3, label %5, !dbg !46

3:                                                ; preds = %0
  %4 = load volatile i32, i32* getelementptr inbounds ([10000 x i32], [10000 x i32]* @svp_simple_001_001_global_array, i64 0, i64 9999), align 4, !dbg !48, !tbaa !19
  br label %7, !dbg !49

5:                                                ; preds = %0
  %6 = load volatile i32, i32* getelementptr inbounds ([10000 x i32], [10000 x i32]* @svp_simple_001_001_global_array, i64 0, i64 0), align 16, !dbg !50, !tbaa !19
  br label %7

7:                                                ; preds = %5, %3
  %8 = load volatile i32, i32* getelementptr inbounds ([10000 x i32], [10000 x i32]* @svp_simple_001_001_global_array, i64 0, i64 1000), align 16, !dbg !51, !tbaa !19
  %9 = load volatile i32, i32* @svp_simple_001_001_global_var, align 4, !dbg !52, !tbaa !19
  ret void, !dbg !53
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_001_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_001")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_001_001_main", scope: !8, file: !8, line: 25, type: !9, scopeLine: 25, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_001_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_001")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 26, column: 3, scope: !7)
!11 = !DILocation(line: 28, column: 3, scope: !7)
!12 = !DILocation(line: 30, column: 3, scope: !7)
!13 = !DILocation(line: 32, column: 8, scope: !7)
!14 = !DILocation(line: 0, scope: !7)
!15 = !DILocation(line: 32, column: 21, scope: !7)
!16 = !DILocation(line: 32, column: 3, scope: !7)
!17 = !DILocation(line: 32, column: 35, scope: !7)
!18 = !DILocation(line: 32, column: 70, scope: !7)
!19 = !{!20, !20, i64 0}
!20 = !{!"int", !21, i64 0}
!21 = !{!"omnipotent char", !22, i64 0}
!22 = !{!"Simple C/C++ TBAA"}
!23 = !DILocation(line: 32, column: 31, scope: !7)
!24 = distinct !{!24, !16, !25}
!25 = !DILocation(line: 32, column: 72, scope: !7)
!26 = !DILocation(line: 34, column: 8, scope: !7)
!27 = !DILocation(line: 34, column: 21, scope: !7)
!28 = !DILocation(line: 34, column: 3, scope: !7)
!29 = !DILocation(line: 35, column: 11, scope: !7)
!30 = !DILocation(line: 35, column: 9, scope: !7)
!31 = !DILocation(line: 35, column: 23, scope: !7)
!32 = !DILocation(line: 35, column: 58, scope: !7)
!33 = !DILocation(line: 36, column: 3, scope: !7)
!34 = !DILocation(line: 34, column: 31, scope: !7)
!35 = distinct !{!35, !28, !33}
!36 = !DILocation(line: 37, column: 1, scope: !7)
!37 = distinct !DISubprogram(name: "svp_simple_001_001_isr_1", scope: !8, file: !8, line: 39, type: !9, scopeLine: 39, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!38 = !DILocation(line: 40, column: 3, scope: !37)
!39 = !DILocation(line: 41, column: 34, scope: !37)
!40 = !DILocation(line: 43, column: 33, scope: !37)
!41 = !DILocation(line: 44, column: 33, scope: !37)
!42 = !DILocation(line: 46, column: 3, scope: !37)
!43 = !DILocation(line: 48, column: 3, scope: !37)
!44 = !DILocation(line: 49, column: 1, scope: !37)
!45 = distinct !DISubprogram(name: "svp_simple_001_001_isr_2", scope: !8, file: !8, line: 51, type: !9, scopeLine: 51, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!46 = !DILocation(line: 53, column: 7, scope: !45)
!47 = !DILocation(line: 53, column: 38, scope: !45)
!48 = !DILocation(line: 55, column: 15, scope: !45)
!49 = !DILocation(line: 55, column: 5, scope: !45)
!50 = !DILocation(line: 58, column: 9, scope: !45)
!51 = !DILocation(line: 60, column: 13, scope: !45)
!52 = !DILocation(line: 64, column: 13, scope: !45)
!53 = !DILocation(line: 65, column: 1, scope: !45)
