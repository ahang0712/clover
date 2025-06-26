; ModuleID = 'svp_simple_005_001-opt.bc'
source_filename = "./svp_simple_005_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_005_001_global_condition = global i32 0, align 4
@svp_simple_005_001_global_var = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_005_001_main() #0 !dbg !7 {
  call void (...) @init(), !dbg !10
  br label %1, !dbg !11

1:                                                ; preds = %17, %0
  %.0 = phi i32 [ 0, %0 ], [ %18, %17 ], !dbg !12
  %2 = icmp slt i32 %.0, 10000, !dbg !13
  br i1 %2, label %4, label %3, !dbg !14

3:                                                ; preds = %1
  br label %19

4:                                                ; preds = %1
  br label %5, !dbg !15

5:                                                ; preds = %14, %4
  %.01 = phi i32 [ 0, %4 ], [ %15, %14 ], !dbg !12
  %6 = icmp slt i32 %.01, 10000, !dbg !16
  br i1 %6, label %8, label %7, !dbg !17

7:                                                ; preds = %5
  br label %16

8:                                                ; preds = %5
  %9 = icmp eq i32 %.0, 9999, !dbg !18
  br i1 %9, label %10, label %13, !dbg !19

10:                                               ; preds = %8
  %11 = icmp eq i32 %.01, 1000, !dbg !20
  br i1 %11, label %12, label %13, !dbg !21

12:                                               ; preds = %10
  store volatile i32 1, i32* @svp_simple_005_001_global_var, align 4, !dbg !22, !tbaa !23
  br label %13, !dbg !27

13:                                               ; preds = %12, %10, %8
  br label %14, !dbg !28

14:                                               ; preds = %13
  %15 = add nsw i32 %.01, 1, !dbg !29
  br label %5, !dbg !17, !llvm.loop !30

16:                                               ; preds = %7
  br label %17, !dbg !31

17:                                               ; preds = %16
  %18 = add nsw i32 %.0, 1, !dbg !32
  br label %1, !dbg !14, !llvm.loop !33

19:                                               ; preds = %3
  %20 = load volatile i32, i32* @svp_simple_005_001_global_condition, align 4, !dbg !34, !tbaa !23
  %21 = icmp eq i32 %20, 1, !dbg !35
  br i1 %21, label %22, label %23, !dbg !34

22:                                               ; preds = %19
  store volatile i32 9, i32* @svp_simple_005_001_global_var, align 4, !dbg !36, !tbaa !23
  br label %23, !dbg !37

23:                                               ; preds = %22, %19
  store volatile i32 5, i32* @svp_simple_005_001_global_var, align 4, !dbg !38, !tbaa !23
  ret void, !dbg !39
}

declare void @init(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_005_001_isr_1() #0 !dbg !40 {
  call void (...) @idlerun(), !dbg !41
  %1 = load volatile i32, i32* @svp_simple_005_001_global_var, align 4, !dbg !42, !tbaa !23
  ret void, !dbg !43
}

declare void @idlerun(...) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_005_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_005")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_005_001_main", scope: !8, file: !8, line: 12, type: !9, scopeLine: 12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_005_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_005")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 13, column: 3, scope: !7)
!11 = !DILocation(line: 14, column: 8, scope: !7)
!12 = !DILocation(line: 0, scope: !7)
!13 = !DILocation(line: 14, column: 21, scope: !7)
!14 = !DILocation(line: 14, column: 3, scope: !7)
!15 = !DILocation(line: 15, column: 10, scope: !7)
!16 = !DILocation(line: 15, column: 23, scope: !7)
!17 = !DILocation(line: 15, column: 5, scope: !7)
!18 = !DILocation(line: 16, column: 14, scope: !7)
!19 = !DILocation(line: 16, column: 26, scope: !7)
!20 = !DILocation(line: 16, column: 32, scope: !7)
!21 = !DILocation(line: 16, column: 11, scope: !7)
!22 = !DILocation(line: 17, column: 39, scope: !7)
!23 = !{!24, !24, i64 0}
!24 = !{!"int", !25, i64 0}
!25 = !{!"omnipotent char", !26, i64 0}
!26 = !{!"Simple C/C++ TBAA"}
!27 = !DILocation(line: 17, column: 9, scope: !7)
!28 = !DILocation(line: 18, column: 5, scope: !7)
!29 = !DILocation(line: 15, column: 38, scope: !7)
!30 = distinct !{!30, !17, !28}
!31 = !DILocation(line: 19, column: 3, scope: !7)
!32 = !DILocation(line: 14, column: 36, scope: !7)
!33 = distinct !{!33, !14, !31}
!34 = !DILocation(line: 21, column: 7, scope: !7)
!35 = !DILocation(line: 21, column: 43, scope: !7)
!36 = !DILocation(line: 23, column: 35, scope: !7)
!37 = !DILocation(line: 24, column: 3, scope: !7)
!38 = !DILocation(line: 25, column: 33, scope: !7)
!39 = !DILocation(line: 26, column: 1, scope: !7)
!40 = distinct !DISubprogram(name: "svp_simple_005_001_isr_1", scope: !8, file: !8, line: 28, type: !9, scopeLine: 28, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!41 = !DILocation(line: 29, column: 3, scope: !40)
!42 = !DILocation(line: 31, column: 12, scope: !40)
!43 = !DILocation(line: 32, column: 1, scope: !40)
