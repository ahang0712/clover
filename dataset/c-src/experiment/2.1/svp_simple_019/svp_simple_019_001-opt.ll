; ModuleID = 'svp_simple_019_001-opt.bc'
source_filename = "./svp_simple_019_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_019_001_global_condition1 = global i32 1, align 4
@svp_simple_019_001_global_condiiton2 = global i32 1, align 4
@svp_simple_019_001_global_condition3 = global i32 1, align 4
@svp_simple_019_001_global_para1 = common global i32 0, align 4
@svp_simple_019_001_global_para2 = common global i32 0, align 4
@svp_simple_019_001_global_para3 = common global i32 0, align 4
@svp_simple_019_001_global_var1 = common global i32 0, align 4
@svp_simple_019_001_global_var2 = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_019_001_main() #0 !dbg !7 {
  call void (...) @init(), !dbg !10
  %1 = call i32 (...) @rand(), !dbg !11
  %2 = srem i32 %1, 10, !dbg !12
  store volatile i32 %2, i32* @svp_simple_019_001_global_para1, align 4, !dbg !13, !tbaa !14
  %3 = call i32 (...) @rand(), !dbg !18
  %4 = srem i32 %3, 10, !dbg !19
  store volatile i32 %4, i32* @svp_simple_019_001_global_para2, align 4, !dbg !20, !tbaa !14
  %5 = call i32 (...) @rand(), !dbg !21
  %6 = srem i32 %5, 10, !dbg !22
  store volatile i32 %6, i32* @svp_simple_019_001_global_para3, align 4, !dbg !23, !tbaa !14
  %7 = call i32 (...) @rand(), !dbg !24
  store volatile i32 %7, i32* @svp_simple_019_001_global_var1, align 4, !dbg !25, !tbaa !14
  %8 = load volatile i32, i32* @svp_simple_019_001_global_para1, align 4, !dbg !26, !tbaa !14
  %9 = load volatile i32, i32* @svp_simple_019_001_global_para3, align 4, !dbg !27, !tbaa !14
  %10 = add nsw i32 %8, %9, !dbg !28
  %11 = load volatile i32, i32* @svp_simple_019_001_global_para2, align 4, !dbg !29, !tbaa !14
  %12 = icmp sgt i32 %10, %11, !dbg !30
  br i1 %12, label %13, label %15, !dbg !31

13:                                               ; preds = %0
  %14 = load volatile i32, i32* @svp_simple_019_001_global_var2, align 4, !dbg !32, !tbaa !14
  br label %15, !dbg !33

15:                                               ; preds = %13, %0
  %16 = load volatile i32, i32* @svp_simple_019_001_global_var2, align 4, !dbg !34, !tbaa !14
  %17 = load volatile i32, i32* @svp_simple_019_001_global_condition1, align 4, !dbg !35, !tbaa !14
  %18 = icmp eq i32 %17, 1, !dbg !36
  br i1 %18, label %19, label %24, !dbg !37

19:                                               ; preds = %15
  %20 = load volatile i32, i32* @svp_simple_019_001_global_condiiton2, align 4, !dbg !38, !tbaa !14
  %21 = icmp eq i32 %20, 1, !dbg !39
  br i1 %21, label %22, label %24, !dbg !40

22:                                               ; preds = %19
  %23 = load volatile i32, i32* @svp_simple_019_001_global_var1, align 4, !dbg !41, !tbaa !14
  br label %24, !dbg !42

24:                                               ; preds = %22, %19, %15
  call void (...) @idlerun(), !dbg !43
  call void @disable_isr(i32 1), !dbg !44
  %25 = load volatile i32, i32* @svp_simple_019_001_global_condition1, align 4, !dbg !45, !tbaa !14
  %26 = icmp eq i32 %25, 1, !dbg !46
  br i1 %26, label %27, label %32, !dbg !47

27:                                               ; preds = %24
  %28 = load volatile i32, i32* @svp_simple_019_001_global_condition3, align 4, !dbg !48, !tbaa !14
  %29 = icmp eq i32 %28, 1, !dbg !49
  br i1 %29, label %30, label %32, !dbg !50

30:                                               ; preds = %27
  %31 = load volatile i32, i32* @svp_simple_019_001_global_var1, align 4, !dbg !51, !tbaa !14
  br label %32, !dbg !52

32:                                               ; preds = %30, %27, %24
  call void @enable_isr(i32 1), !dbg !53
  call void (...) @idlerun(), !dbg !54
  call void @disable_isr(i32 1), !dbg !55
  %33 = load volatile i32, i32* @svp_simple_019_001_global_condiiton2, align 4, !dbg !56, !tbaa !14
  %34 = icmp eq i32 %33, 1, !dbg !57
  br i1 %34, label %35, label %40, !dbg !58

35:                                               ; preds = %32
  %36 = load volatile i32, i32* @svp_simple_019_001_global_condition3, align 4, !dbg !59, !tbaa !14
  %37 = icmp eq i32 %36, 0, !dbg !60
  br i1 %37, label %38, label %40, !dbg !61

38:                                               ; preds = %35
  %39 = load volatile i32, i32* @svp_simple_019_001_global_var1, align 4, !dbg !62, !tbaa !14
  br label %40, !dbg !63

40:                                               ; preds = %38, %35, %32
  call void @enable_isr(i32 1), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

declare void @init(...) #2

declare i32 @rand(...) #2

declare void @idlerun(...) #2

declare void @disable_isr(i32) #2

declare void @enable_isr(i32) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_019_001_isr_1() #0 !dbg !66 {
  call void (...) @idlerun(), !dbg !67
  %1 = load volatile i32, i32* @svp_simple_019_001_global_para1, align 4, !dbg !68, !tbaa !14
  %2 = load volatile i32, i32* @svp_simple_019_001_global_para3, align 4, !dbg !69, !tbaa !14
  %3 = add nsw i32 %1, %2, !dbg !70
  %4 = load volatile i32, i32* @svp_simple_019_001_global_para2, align 4, !dbg !71, !tbaa !14
  %5 = icmp slt i32 %3, %4, !dbg !72
  br i1 %5, label %6, label %7, !dbg !73

6:                                                ; preds = %0
  store volatile i32 85, i32* @svp_simple_019_001_global_var2, align 4, !dbg !74, !tbaa !14
  br label %7, !dbg !75

7:                                                ; preds = %6, %0
  store volatile i32 0, i32* @svp_simple_019_001_global_condition3, align 4, !dbg !76, !tbaa !14
  store volatile i32 1, i32* @svp_simple_019_001_global_var1, align 4, !dbg !77, !tbaa !14
  ret void, !dbg !78
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_019_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_019")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_019_001_main", scope: !8, file: !8, line: 30, type: !9, scopeLine: 30, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_019_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_019")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 32, column: 3, scope: !7)
!11 = !DILocation(line: 33, column: 37, scope: !7)
!12 = !DILocation(line: 33, column: 44, scope: !7)
!13 = !DILocation(line: 33, column: 35, scope: !7)
!14 = !{!15, !15, i64 0}
!15 = !{!"int", !16, i64 0}
!16 = !{!"omnipotent char", !17, i64 0}
!17 = !{!"Simple C/C++ TBAA"}
!18 = !DILocation(line: 34, column: 37, scope: !7)
!19 = !DILocation(line: 34, column: 44, scope: !7)
!20 = !DILocation(line: 34, column: 35, scope: !7)
!21 = !DILocation(line: 35, column: 37, scope: !7)
!22 = !DILocation(line: 35, column: 44, scope: !7)
!23 = !DILocation(line: 35, column: 35, scope: !7)
!24 = !DILocation(line: 37, column: 36, scope: !7)
!25 = !DILocation(line: 37, column: 34, scope: !7)
!26 = !DILocation(line: 39, column: 8, scope: !7)
!27 = !DILocation(line: 39, column: 42, scope: !7)
!28 = !DILocation(line: 39, column: 40, scope: !7)
!29 = !DILocation(line: 39, column: 77, scope: !7)
!30 = !DILocation(line: 39, column: 75, scope: !7)
!31 = !DILocation(line: 39, column: 7, scope: !7)
!32 = !DILocation(line: 40, column: 15, scope: !7)
!33 = !DILocation(line: 40, column: 5, scope: !7)
!34 = !DILocation(line: 42, column: 13, scope: !7)
!35 = !DILocation(line: 44, column: 8, scope: !7)
!36 = !DILocation(line: 44, column: 45, scope: !7)
!37 = !DILocation(line: 44, column: 51, scope: !7)
!38 = !DILocation(line: 44, column: 55, scope: !7)
!39 = !DILocation(line: 44, column: 92, scope: !7)
!40 = !DILocation(line: 44, column: 7, scope: !7)
!41 = !DILocation(line: 45, column: 15, scope: !7)
!42 = !DILocation(line: 45, column: 5, scope: !7)
!43 = !DILocation(line: 46, column: 3, scope: !7)
!44 = !DILocation(line: 47, column: 3, scope: !7)
!45 = !DILocation(line: 48, column: 8, scope: !7)
!46 = !DILocation(line: 48, column: 45, scope: !7)
!47 = !DILocation(line: 48, column: 51, scope: !7)
!48 = !DILocation(line: 48, column: 55, scope: !7)
!49 = !DILocation(line: 48, column: 92, scope: !7)
!50 = !DILocation(line: 48, column: 7, scope: !7)
!51 = !DILocation(line: 49, column: 15, scope: !7)
!52 = !DILocation(line: 49, column: 5, scope: !7)
!53 = !DILocation(line: 50, column: 3, scope: !7)
!54 = !DILocation(line: 51, column: 3, scope: !7)
!55 = !DILocation(line: 52, column: 3, scope: !7)
!56 = !DILocation(line: 53, column: 8, scope: !7)
!57 = !DILocation(line: 53, column: 45, scope: !7)
!58 = !DILocation(line: 53, column: 51, scope: !7)
!59 = !DILocation(line: 53, column: 55, scope: !7)
!60 = !DILocation(line: 53, column: 92, scope: !7)
!61 = !DILocation(line: 53, column: 7, scope: !7)
!62 = !DILocation(line: 54, column: 15, scope: !7)
!63 = !DILocation(line: 54, column: 5, scope: !7)
!64 = !DILocation(line: 55, column: 3, scope: !7)
!65 = !DILocation(line: 56, column: 1, scope: !7)
!66 = distinct !DISubprogram(name: "svp_simple_019_001_isr_1", scope: !8, file: !8, line: 58, type: !9, scopeLine: 58, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!67 = !DILocation(line: 59, column: 3, scope: !66)
!68 = !DILocation(line: 60, column: 8, scope: !66)
!69 = !DILocation(line: 60, column: 42, scope: !66)
!70 = !DILocation(line: 60, column: 40, scope: !66)
!71 = !DILocation(line: 60, column: 77, scope: !66)
!72 = !DILocation(line: 60, column: 75, scope: !66)
!73 = !DILocation(line: 60, column: 7, scope: !66)
!74 = !DILocation(line: 61, column: 36, scope: !66)
!75 = !DILocation(line: 61, column: 5, scope: !66)
!76 = !DILocation(line: 63, column: 40, scope: !66)
!77 = !DILocation(line: 65, column: 34, scope: !66)
!78 = !DILocation(line: 66, column: 1, scope: !66)
